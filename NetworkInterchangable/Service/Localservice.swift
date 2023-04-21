//
//  Localservice.swift
//  NetworkInterchangable
//
//  Created by YASIN on 21.04.2023.
//

import Foundation

class Localservice {
    func downloadUsers(_ resources: String) async throws -> [User] {
        guard let path = Bundle.main.path(forResource: resources, ofType: "json") else {
            fatalError("Cannot find resource")
        }
        
        let data = try Data(contentsOf: URL(filePath: path))
        return try JSONDecoder().decode([User].self, from: data)
    }
}
