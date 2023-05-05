//
//  UnicAPIRequestsConfiguration.swift
//  
//
//  Created by Ressier Mathilde on 05/05/2023.
//

import Foundation

/// Default configuration for all requests related to UnicAPI back-end
struct UnicAPIRequestsConfiguration: NetworkProviderConfiguration {
    /// Base URL linking to the back-end
    var baseUrl: String

    /// Global header to use in every request (giving language parameters or bearer token)
    var header: RequestsHeader = .init()

    // MARK: - Header

    struct RequestsHeader: Encodable {
        /// Authorization Token to use
        var authorization: String?
    }
}
