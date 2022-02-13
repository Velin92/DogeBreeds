//
//  Endpoint.swift
//  DogeBreeds
//
//  Created by Mauro Romito on 13/02/22.
//

import Foundation

import Alamofire

protocol Endpoint: URLRequestConvertible {
    static var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var parameterEncoding: ParameterEncoding { get }
}

extension URLRequestConvertible where Self: Endpoint {
    func asURLRequest() throws -> URLRequest {
        let url = Self.baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        return try parameterEncoding.encode(request, with: parameters)
    }
}
