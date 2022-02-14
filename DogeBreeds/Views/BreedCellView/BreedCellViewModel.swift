//
//  BreedCellViewModel.swift
//  DogeBreeds
//
//  Created by Mauro Romito on 13/02/22.
//

import Foundation

struct BreedCellViewModel {
    let imageUrl: URL?
    private let breed: String
    private let subBreeds: Int
    let isFavourite: Bool
    var favouriteTapped: (() -> ())?
    
    var breedText: String { breed.capitalizingFirstLetter() }
    var subBreedsText: String { "Sub Breeds: \(subBreeds)" }
}

extension BreedCellViewModel {
    init(model: BreedModel, favouriteTapped: (()->())?) {
        self.imageUrl = model.imageUrls.first
        self.breed = model.name
        self.subBreeds = model.subBreeds.count
        self.isFavourite = model.isFavourite
        self.favouriteTapped = favouriteTapped
    }
}

extension BreedCellViewModel: Identifiable {
    var id: String { breed }
}

extension BreedCellViewModel {
    static func stub(isFavourite: Bool = false) -> BreedCellViewModel {
        BreedCellViewModel(
            imageUrl: URL(string: "https://images.dog.ceo/breeds/shiba/shiba-17.jpg")!,
            breed: "Doge",
            subBreeds: 0,
            isFavourite: isFavourite
        )
    }
}
