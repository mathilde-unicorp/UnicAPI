//
//  UnicApi+NetworkProvider.swift
//
//
//  Created by Ressier Mathilde on 17/02/2023.
//

import Foundation

/// UnicApiNetworkProviderProtocol
///
/// Methods that must be implemented by UnicAPI NetworkProvider to give access to configuration
/// headers & parameters of requests
protocol UnicApiNetworkProviderProtocol: NetworkProviderProtocol {
    /// Update the token used in request authorizations
    func update(token: TokenType?)
}

extension UnicAPI {

    // MARK: UnicAPI NetworkProvider using URLSession

    class NetworkProvider:
        URLSessionNetworkProvider<UnicAPI.RequestsConfiguration>,
        UnicApiNetworkProviderProtocol {
        
        public func update(token: TokenType?) {
            self.configuration.header.authorization = token?.description
        }
    }
}

extension UnicAPI {

    // MARK: - Request Configuration

    /// Default configuration for all requests related to UnicAPI back-end
    struct RequestsConfiguration: NetworkProviderConfiguration {
        /// Base URL linking to the back-end
        var baseUrl: String
        /// Global header to use in every request (giving language parameters or bearer token)
        var header: RequestsHeader = .init()
    }

    // MARK: - Header

    struct RequestsHeader: Encodable {
        /// Authorization Token to use
        var authorization: String?
    }
}
