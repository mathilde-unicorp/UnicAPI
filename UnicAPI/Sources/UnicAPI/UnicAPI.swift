//
//  UnicAPIRequestsConfiguration.swift
//
//
//  Created by Ressier Mathilde on 05/05/2023.
//

/// Create your UnicAPI combining the network provider of your choice and the services you want to implements
public struct UnicAPI {

    // -------------------------------------------------------------------------
    // MARK: - Properties
    // -------------------------------------------------------------------------

    // MARK: Services

//    public var healthProfessionalsService: ConexAPIHealthProfessionalsService
//    public var authenticationService: ConexAPIAuthenticationService
//    public var userService: ConexAPIUserService

    // MARK: Network Provider

    typealias UnicAPINetworkProvider = URLSessionNetworkProvider<UnicAPIRequestsConfiguration>

    private let networkProvider: UnicAPINetworkProvider

    // -------------------------------------------------------------------------
    // MARK: - Init
    // -------------------------------------------------------------------------

    public init(
        baseURL: String = ""
    ) {
        let configuration = UnicAPIRequestsConfiguration(baseUrl: baseURL)
        self.networkProvider = UnicAPINetworkProvider(configuration: configuration)

//        self.healthProfessionalsService = ConexAPIHealthProfessionalsService(networkProvider: networkProvider)
//        self.authenticationService = ConexAPIAuthenticationService(networkProvider: networkProvider)
//        self.userService = ConexAPIUserService(networkProvider: networkProvider)
    }

    // -------------------------------------------------------------------------
    // MARK: - Methods
    // -------------------------------------------------------------------------

    public func setToken(_ token: TokenType?) {
        self.networkProvider.configuration.header.authorization = token?.description
    }
}
