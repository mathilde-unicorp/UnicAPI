//
//  URLSessionNetworkProvider.swift
//
//
//  Created by Ressier Mathilde on 07/02/2023.
//

import Foundation

struct URLSessionRequest: NetworkRequest {
    var requestType: RequestType

    var endpoint: String

    var parameters: [String: Any]?

    var headers: Encodable

    var body: Encodable?

    var contentType: ContentType = .json

    var encoder: JSONEncoder = JSONEncoder()
}

class URLSessionNetworkProvider<Config: NetworkProviderConfiguration>: NetworkProviderProtocol {

    // MARK: - Properties

    private var responseFactory: URLResponseFactory
    private var session: URLSession

    var configuration: Config

    init(
        configuration: Config,
        encoder: JSONEncoder = JSONEncoder(),
        decoder: JSONDecoder = JSONWithDateDecoder(),
        session: URLSession = .shared
    ) {
        self.configuration = configuration
        self.responseFactory = URLResponseFactory(decoder: decoder)
        self.session = session
    }

    func send<T: Decodable>(request: NetworkRequest) async throws -> T {
        guard let urlRequest = request.buildRequest(from: self.configuration.baseUrl) else {
            log.error("Cannot create request. Base URL: \(configuration.baseUrl)")
            log.error("Endpoint: \"\(request.endpoint)\", parameters: \"\(request.parameters ?? [:]))\"")
            throw NetworkProviderError.invalidURL
        }

        log.debug("Send Request: \(String(describing: urlRequest.url))")

        let result = try await session.data(for: urlRequest)
        return try responseFactory.decodeResponse(data: result.0, response: result.1)
    }

    // MARK: - Methods

    /// Execute a get request on the given endpoint with the given parameters included to the request
    func get<T>(endpoint: String, parameters: [String: Any]) async throws -> T where T: Decodable {
        let request = URLSessionRequest(requestType: .GET, endpoint: endpoint, parameters: parameters, headers: configuration.header, body: nil)
        return try await send(request: request)
    }

    // MARK: Post Convenience

    func post<T: Decodable, B: Encodable>(endpoint: String, body: B, contentType: ContentType?) async throws -> T {
        let request = URLSessionRequest(
            requestType: .POST,
            endpoint: endpoint,
            headers: configuration.header,
            body: body,
            contentType: contentType ?? .json
        )
        return try await send(request: request)
    }

    // MARK: Patch convenience

    func patch<T: Decodable, B: Encodable>(endpoint: String, body: B, contentType: ContentType?) async throws -> T {
        let request = URLSessionRequest(
            requestType: .PATCH,
            endpoint: endpoint,
            headers: configuration.header,
            body: body,
            contentType: contentType ?? .json
        )
        return try await send(request: request)
    }

    // MARK: Patch convenience

    func put<T: Decodable, B: Encodable>(endpoint: String, body: B, contentType: ContentType?) async throws -> T {
        let request = URLSessionRequest(
            requestType: .PUT,
            endpoint: endpoint,
            headers: configuration.header,
            body: body,
            contentType: contentType ?? .json
        )
        return try await send(request: request)
    }

}
