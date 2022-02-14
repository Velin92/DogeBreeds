//
//  BreedCellViewModel.swift
//  DogeBreeds
//
//  Created by Mauro Romito on 13/02/22.
//

import Foundation

struct BreedCellViewModel {
    let imageUrl: URL?
    let name: String
    let subBreedsInfo: String
    let isFavourite: Bool
    var favouriteTapped: (() -> ())?
}

extension BreedCellViewModel {
    init(model: BreedModel, favouriteTapped: (()->())?) {
        self.imageUrl = model.imageUrls.first
        self.name = model.name.capitalizingFirstLetter()
        self.subBreedsInfo = "Sub Breeds: \(model.subBreeds.count)"
        self.isFavourite = model.isFavourite
        self.favouriteTapped = favouriteTapped
    }
}

extension BreedCellViewModel {
    static func stub(isFavourite: Bool = false) -> BreedCellViewModel {
        BreedCellViewModel(
            imageUrl: URL(string: "https://images.dog.ceo/breeds/shiba/shiba-17.jpg")!,
            name: "Doge",
            subBreedsInfo: "Sub Doges: 0",
            isFavourite: isFavourite
        )
    }
}
