//
//  NetworkProvider.swift
//
//
//  Created by Ressier Mathilde on 07/02/2023.
//

import Foundation

protocol NetworkProviderProtocol {
    func send<T: Decodable>(request: NetworkRequest) async throws -> T
    func get<T: Decodable>(endpoint: String, parameters: [String: Any]) async throws -> T
    func post<T: Decodable, B: Encodable>(endpoint: String, body: B, contentType: ContentType?) async throws -> T
    func patch<T: Decodable, B: Encodable>(endpoint: String, body: B, contentType: ContentType?) async throws -> T
    func put<T: Decodable, B: Encodable>(endpoint: String, body: B, contentType: ContentType?) async throws -> T
}

extension NetworkProviderProtocol {

    func get<T: Decodable>(endpoint: String, parameters: [String: Any] = [:]) async throws -> T {
        return try await self.get(endpoint: endpoint, parameters: parameters)
    }

    func post<T: Decodable, B: Encodable>(endpoint: String, body: B, contentType: ContentType? = nil) async throws -> T {
        return try await post(endpoint: endpoint, body: body, contentType: contentType)
    }

    func patch<T: Decodable, B: Encodable>(endpoint: String, body: B, contentType: ContentType? = nil) async throws -> T {
        return try await patch(endpoint: endpoint, body: body, contentType: contentType)
    }

    func put<T: Decodable, B: Encodable>(endpoint: String, body: B, contentType: ContentType? = nil) async throws -> T {
        return try await put(endpoint: endpoint, body: body, contentType: contentType)
    }
}
