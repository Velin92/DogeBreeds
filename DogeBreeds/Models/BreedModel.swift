//
//  BreedModel.swift
//  DogeBreeds
//
//  Created by Mauro Romito on 13/02/22.
//

import Foundation

struct BreedModel: Equatable {
    let name: String
    let subBreeds: [String]
    let imageUrls: [URL]
    var isFavourite: Bool
}

extension BreedModel: Identifiable {
    var id: String { name }
}
