//
//  BreedsListResponse.swift
//  DogeBreeds
//
//  Created by Mauro Romito on 13/02/22.
//

import Foundation

// MARK: - BreedsListResponse
struct BreedsListResponse: Decodable {
    typealias Breed = String
    typealias SubBreed = String
    
    let breedsList: [Breed: [SubBreed]]?
    
    enum CodingKeys: String, CodingKey {
        case breedsList = "message"
    }
}
