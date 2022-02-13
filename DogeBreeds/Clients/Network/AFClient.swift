//
//  AFClient.swift
//  DogeBreeds
//
//  Created by Mauro Romito on 13/02/22.
//

import Combine
import Foundation

import Alamofire

final class AFClient {
    func response<Response: Decodable>(
        _ request: URLRequestConvertible,
        receiveOn queue: DispatchQueue = .main
    ) -> AnyPublisher<Response, Error> {
        AF.request(request)
            .validate()
            .publishDecodable(type: Response.self)
            .value()
            .mapError { $0 }
            .receive(on: queue)
            .eraseToAnyPublisher()
    }
}
