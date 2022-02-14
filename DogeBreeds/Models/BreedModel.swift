//
//  BreedModel.swift
//  DogeBreeds
//
//  Created by Mauro Romito on 13/02/22.
//

import Foundation

struct BreedModel {
    let name: String
    let subBreeds: [String]
    let imageUrls: [URL]
    let isFavourite: Bool
}

extension BreedModel: Identifiable {
    var id: String { name }
}
