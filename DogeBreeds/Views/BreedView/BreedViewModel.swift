//
//  BreedViewModel.swift
//  DogeBreeds
//
//  Created by Mauro Romito on 14/02/22.
//

import Foundation

struct BreedViewModel {
    let title: String
    let images: [URL]
    let subBreeds: [String]
}

extension BreedViewModel {
    init(model: BreedModel) {
        self.title = model.name.capitalizingFirstLetter()
        self.images = model.imageUrls
        self.subBreeds = model.subBreeds.map { $0.capitalizingFirstLetter() }
    }
}

extension BreedViewModel {
    static func subBreedsStub(count: Int) -> [String] {
        var result: [String] = []
        for index in 0..<count {
            result.append("Sub Doge \(index)")
        }
        return result
    }
    
    static func stub(imagesCount: Int = 20, subBreedsCount: Int = 20) -> BreedViewModel{
        BreedViewModel(
            title: "Doge",
            images: [URL](repeating: URL(string: "https://images.dog.ceo/breeds/shiba/shiba-17.jpg")!, count: imagesCount),
            subBreeds: Self.subBreedsStub(count: subBreedsCount)
        )
    }
}
