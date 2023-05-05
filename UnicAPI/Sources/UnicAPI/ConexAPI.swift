import Foundation

//public class ConexAPI: ConexAPIProtocol {
//
//    // -------------------------------------------------------------------------
//    // MARK: - Properties
//    // -------------------------------------------------------------------------
//
////    public var healthProfessionalsService: ConexAPIHealthProfessionalsService
////    public var authenticationService: ConexAPIAuthenticationService
////    public var userService: ConexAPIUserService
//
//    // -------------------------------------------------------------------------
//    // MARK: - Init
//    // -------------------------------------------------------------------------
//
//    public init(
//        baseURL: String = "https://devci-backend.conexsante.com/"
//    ) {
//        let configuration = UnicAPI.RequestsConfiguration(baseUrl: baseURL)
//        let networkProvider = UnicAPI.NetworkProvider(configuration: configuration)
//
////        self.healthProfessionalsService = ConexAPIHealthProfessionalsService(networkProvider: networkProvider)
////        self.authenticationService = ConexAPIAuthenticationService(networkProvider: networkProvider)
////        self.userService = ConexAPIUserService(networkProvider: networkProvider)
//    }
//
//    // -------------------------------------------------------------------------
//    // MARK: - Methods
//    // -------------------------------------------------------------------------
//
//    public func setToken(_ token: TokenType?) {
//        let networkProviders = [
////            self.healthProfessionalsService.networkProvider,
////            self.authenticationService.networkProvider,
////            self.userService.networkProvider
//        ]
//
//        networkProviders.forEach { $0.update(token: token) }
//    }
//}
