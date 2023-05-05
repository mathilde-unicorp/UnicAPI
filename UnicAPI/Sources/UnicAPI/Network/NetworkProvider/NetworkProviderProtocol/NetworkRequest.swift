//
//  URLRequestFactory.swift
//
//
//  Created by Ressier Mathilde on 07/02/2023.
//

import Foundation

enum RequestType: String {
    case POST
    case GET
    case PATCH
    case PUT
}

/// Content types available for requests
enum ContentType: String, Codable {
    case json = "application/json"
    case xwwwFormUrlEncoded = "application/x-www-form-urlencoded"
}

protocol NetworkRequest {
    var requestType: RequestType { get }

    var endpoint: String { get }

    var parameters: [String: Any]? { get }

    var headers: Encodable { get }

    var body: Encodable? { get }

    var contentType: ContentType { get }

    var encoder: JSONEncoder { get }

    func buildRequest(from baseURL: String) -> URLRequest?
}

extension NetworkRequest {
    func buildRequest(from baseURL: String) -> URLRequest? {
        guard let url = buildURL(from: baseURL, parameters: self.parameters) else {
            return nil
        }

        var request = URLRequest(url: url)
        request.configure(with: self.headers)
        request.setContentType(self.contentType)
        request.httpMethod = self.requestType.rawValue

        if let body = body?.data(ofType: self.contentType) {
            request.httpBody = body
        }

        request.debug()

        return request
    }

    private func buildURL(from baseUrl: String, parameters: [String: Any]?) -> URL? {
        let mainURL = URL(string: baseUrl)?.appendingPathComponent(endpoint)

        var urlComponents = URLComponents(string: mainURL!.absoluteString)

        // Always add required parameters to query
        if let parameters = parameters {
            urlComponents?.queryItems = parameters.queryItems
        }

        return urlComponents?.url
    }
}
