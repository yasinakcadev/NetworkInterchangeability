//
//  NetworkServiceProtocol.swift
//  NetworkInterchangable
//
//  Created by YASIN on 21.04.2023.
//

import Foundation

protocol NetworkService {
    var type: String { get }
    func downloadUsers(_ resource: String) async throws -> [User]
}
