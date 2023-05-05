//
//  GlobalRequestsConfiguration.swift
//
//
//  Created by Ressier Mathilde on 07/02/2023.
//

import Foundation

/// Network Provider Configuration
///
/// To process requests, the NetworkProvider (e.g. URLSession, Alamofire, ...) requires some configuration
/// like required `parameters` for all requests (e.g. lang, user id, ...) or `headers` (e.g. bearer token)
protocol NetworkProviderConfiguration {
    associatedtype Header: Encodable

    var baseUrl: String { get }

    /// Headers required through requests
    var header: Header { get set }
}
