//
//  BreedsListViewModel.swift
//  DogeBreeds
//
//  Created by Mauro Romito on 13/02/22.
//

import Foundation

import Combine

final class BreedsListViewModel: ObservableObject {
    @Published var isFilterEnabled: Bool = false
    @Published private var breeds: [BreedModel] = []
    
    var filteredBreeds: [BreedModel] {
        let isFilterEnabled = self.isFilterEnabled
        return breeds.filter { breed in
            isFilterEnabled ? breed.isFavourite : true
        }
    }
    
    private let breedsService: BreedServiceProtocol
    
    private var cancellables = Set<AnyCancellable>()
    
    init(breedsService: BreedServiceProtocol = BreedService()) {
        self.breedsService = breedsService
    }
    
    func onAppear() {
        self.breedsService.getAllBreeds()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error): print(error)
                case .finished: break
                }
            }, receiveValue: { [weak self] breeds in
                self?.breeds = breeds
            })
            .store(in: &self.cancellables)
    }
    
    func getCellViewModel(for breed: BreedModel) -> BreedCellViewModel {
        return BreedCellViewModel(model: breed) { [weak self] in
            self?.favouriteTapped(for: breed)
        }
    }
    
    func favouriteTapped(for breed: BreedModel) {
        print("tap")
        guard let index = breeds .firstIndex(where: { $0 == breed })else { return }
        let selectedBreed = breeds[index]
        let newValue = !selectedBreed.isFavourite
        breeds[index].isFavourite = newValue
        breedsService.setFavourite(newValue, for: selectedBreed)
    }
}
