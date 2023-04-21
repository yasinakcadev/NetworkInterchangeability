//
//  Networking.swift
//  NetworkInterchangable
//
//  Created by YASIN on 21.04.2023.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case responseError
}
class Webservice {
    
    func downloadUsers(_ resource: String) async throws -> [User] {
        guard let url = URL(string: resource) else {
            throw NetworkError.badUrl
        }
        
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse , httpResponse.statusCode == 200 else {
            throw NetworkError.responseError
        }
        
        return try JSONDecoder().decode([User].self, from: data)
    }
}
