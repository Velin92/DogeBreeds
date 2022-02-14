//
//  BreedsListViewModel.swift
//  DogeBreeds
//
//  Created by Mauro Romito on 13/02/22.
//

import Foundation

import Combine

final class BreedsListViewModel: ObservableObject {
    @Published var breeds: [BreedModel] = []
    
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
        return BreedCellViewModel(model: breed, favouriteTapped: nil)
    }
}
