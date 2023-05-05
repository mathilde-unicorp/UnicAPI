//
//  MockConexAPI.swift
//
//
//  Created by Ressier Mathilde on 17/02/2023.
//

import Foundation

public class MockUnicAPI: UnicAPIProtocol {

    // -------------------------------------------------------------------------
    // MARK: - Properties
    // -------------------------------------------------------------------------

    // MARK: API Services

//    public var healthProfessionalsService = MockHealthProfessionalsService()
//    public var authenticationService = MockAuthenticationService()
//    public var userService = MockUserService()

    // MARK: Authentication

    private var token: TokenType?

    // -------------------------------------------------------------------------
    // MARK: - Methods
    // -------------------------------------------------------------------------

    // MARK: Authentication

    public func setToken(_ token: TokenType?) {
        self.token = token
    }
}
