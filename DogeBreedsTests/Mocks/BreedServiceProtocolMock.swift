//
//  BreedServiceProtocolMock.swift
//  DogeBreedsTests
//
//  Created by Mauro Romito on 14/02/22.
//

import Combine
import Foundation
@testable import DogeBreeds

enum ErroStub: Error {
    case stub
}

final class BreedServiceProtocolMock: BreedServiceProtocol {
    var favourite: [BreedModel: Bool] = [:]
    var getAllBreedsImpl: AnyPublisher<[BreedModel], Error>
    
    init(getAllBreedsImpl: AnyPublisher<[BreedModel], Error>) {
        self.getAllBreedsImpl = getAllBreedsImpl
    }
    
    func getAllBreeds() -> AnyPublisher<[BreedModel], Error> {
        return getAllBreedsImpl
    }
    
    func setFavourite(_ value: Bool, for breed: BreedModel) {
        favourite[breed] = value
    }
}
