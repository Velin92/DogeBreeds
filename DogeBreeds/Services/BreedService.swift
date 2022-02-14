//
//  BreedService.swift
//  DogeBreeds
//
//  Created by Mauro Romito on 13/02/22.
//

import Combine
import Foundation

protocol BreedServiceProtocol {
    func getAllBreeds() -> AnyPublisher<[BreedModel], Error>
    func setFavourite(_ value: Bool, for breed: BreedModel)
}

final class BreedService: BreedServiceProtocol {
    
    private let restClient = AFClient()
    @Storage(key: "favourite_breeds", defaultValue: [:]) private var favouriteBreeds: [String: Bool]
    
    private var cancellables = Set<AnyCancellable>()
    
    func getAllBreeds() -> AnyPublisher<[BreedModel], Error> {
        let breedsRequest: AnyPublisher<BreedsListResponse, Error> = self.restClient.response(DogAPIEndpoint.getAllBreeds)
            .share()
            .eraseToAnyPublisher()
        
        let imagesRequest = breedsRequest
            .flatMap { [weak self] response -> AnyPublisher<[String: [URL]], Never> in
                guard let self = self else {
                    return Empty()
                        .eraseToAnyPublisher()
                }
                return self.getImagesDictionary(for: response)
            }
            .eraseToAnyPublisher()
        
        return Publishers.CombineLatest(breedsRequest, imagesRequest)
            .compactMap { [weak self] combinedValue -> [BreedModel]? in
                guard let self = self else { return nil }
                let breedsResponse = combinedValue.0
                let imagesDictionary = combinedValue.1
                var breedModels: [BreedModel] = []
                breedsResponse.breedsList?.forEach { element in
                    let urls = imagesDictionary[element.key]
                    let breed = BreedModel(name: element.key, subBreeds: element.value, imageUrls: urls ?? [], isFavourite: self.favouriteBreeds[element.key] ?? false)
                    breedModels.append(breed)
                }
                return breedModels
            }
            .eraseToAnyPublisher()
    }
    
    private func getImagesDictionary(for response: BreedsListResponse) -> AnyPublisher<[String: [URL]], Never> {
        var values: [String] = []
        if let keys = response.breedsList?.map({ $0.key }) {
            values = keys
        }
        return values
            .publisher
            .flatMap { [weak self] breed -> AnyPublisher<(id: String, response: ImagesResponse)?, Never> in
                guard let self = self else {
                    return Empty()
                        .eraseToAnyPublisher()
                }
                return self.getImages(for: breed)
            }
            .compactMap { element -> (id: String, urls: [URL])? in
                guard let element = element,
                      let urlStrings = element.response.urls else { return nil }
                let urls = urlStrings.compactMap { URL(string: $0)}
                return (id: element.id, urls: urls)
            }
            .collect()
            .map { array in
                var result: [String: [URL]] = [:]
                array.forEach { element in
                    result[element.id] = element.urls
                }
                return result
            }
            .eraseToAnyPublisher()
    }
    
    private func getImages(for breedId: String) -> AnyPublisher<(id: String, response: ImagesResponse)?, Never> {
        return self.restClient.response(DogAPIEndpoint.getImages(breed: breedId))
            .map { response in
                return (id: breedId, response: response)
            }
            .replaceError(with: nil)
            .eraseToAnyPublisher()
    }
    
    func setFavourite(_ value: Bool, for breed: BreedModel) {
        self.favouriteBreeds[breed.id] = value
    }
}
