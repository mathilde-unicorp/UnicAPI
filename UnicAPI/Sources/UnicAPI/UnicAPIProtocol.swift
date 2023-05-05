//
//  ConexAPIProtocol.swift
//
//
//  Created by Ressier Mathilde on 17/02/2023.
//

import Foundation
import SwiftyBeaver

/// Logger object to call to print debug, info, warning, or error on the console
let log = SwiftyBeaver.self

public protocol UnicAPIProtocol {
//    associatedtype HealthProfessionalsServiceSource: HealthProfessionalsService
//    associatedtype AuthenticationServiceSource: AuthenticationService
//    associatedtype UserServiceSource: UserService

//    var healthProfessionalsService: HealthProfessionalsServiceSource { get }
//    var authenticationService: AuthenticationServiceSource { get }
//    var userService: UserServiceSource { get }

    func setToken(_ token: TokenType?)
}

extension UnicAPIProtocol {
    public func activateLogs(areLogsActivated: Bool) -> any UnicAPIProtocol {
        log.removeAllDestinations()

        if areLogsActivated {
            let console = ConsoleDestination()
            log.addDestination(console)
        }

        return self
    }
}
