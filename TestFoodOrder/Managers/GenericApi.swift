//
//  GenericApi.swift
//  TestFoodOrder
//
//  Created by Alisultan Abdullah on 6.07.2023.
//

import Foundation

protocol GenericApi {
    var session: URLSession { get }
    var decoder: JSONDecoder { get }
    func fetch<T: Codable>(type: T.Type, from urlString: String) async throws -> T
}

extension GenericApi {
    func fetch<T: Codable>(type: T.Type, from urlString: String) async throws -> T {
        
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        
        let (data, response) = try await session.data(from: url)
        
        guard let response = response as? HTTPURLResponse else { throw URLError(.badServerResponse) }
        
        switch response.statusCode {
        case (200...299):
            print(response.statusCode)
            return try decoder.decode(type, from: data)
        default:
            fatalError("A server error has occurred!")
        }
    }
}
