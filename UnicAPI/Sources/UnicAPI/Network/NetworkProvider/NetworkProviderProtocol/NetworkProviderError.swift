//
//  NetworkProviderError.swift
//
//
//  Created by Ressier Mathilde on 07/02/2023.
//

import Foundation

public enum NetworkProviderError: Error, Equatable {
    case invalidURL
    case requestFailed
    case noResponse
    case noData
    case mimeTypeInvalid
    case conversionFailed(data: Data)
    case statusError(status: HTTPStatusCode)
}
