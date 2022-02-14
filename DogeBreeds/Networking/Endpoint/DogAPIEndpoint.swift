//
//  DogAPIEndpoint.swift
//  DogeBreeds
//
//  Created by Mauro Romito on 13/02/22.
//

import Foundation

import Alamofire

enum DogAPIEndpoint {
    static let baseURL = URL(string: "https://dog.ceo/api/")!
    
    case getAllBreeds
    case getImages(breed: String)
}

extension DogAPIEndpoint: Endpoint {
    var path: String {
        switch self {
        case .getAllBreeds: return "breeds/list/all"
        case .getImages(let breed): return "breed/\(breed)/images"
        }
    }
    
    var method: HTTPMethod { .get }
    
    var parameters: Parameters? { nil }
    
    var parameterEncoding: ParameterEncoding {
        switch self.method {
        case .get: return URLEncoding()
        default: return JSONEncoding.default
        }
    }
}
