//
//  ImagesResponse.swift
//  DogeBreeds
//
//  Created by Mauro Romito on 13/02/22.
//

import Foundation

// MARK: - ImagesResponse
struct ImagesResponse: Codable {
    let urls: [String]?
    
    enum CodingKeys: String, CodingKey {
        case urls = "message"
    }
}
