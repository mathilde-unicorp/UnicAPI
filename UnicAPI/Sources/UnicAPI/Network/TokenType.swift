//
//  File.swift
//
//
//  Created by Ressier Mathilde on 08/02/2023.
//

import Foundation

// MARK: - Token

public enum TokenType: Codable, CustomStringConvertible {
    case bearer(token: String)

    public var description: String {
        switch self {
        case .bearer(let value):
            return "Bearer \(value)"
        }
    }
}
