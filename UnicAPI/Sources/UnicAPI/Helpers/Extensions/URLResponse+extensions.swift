//
//  URLResponse+extensions.swift
//
//
//  Created by Ressier Mathilde on 07/02/2023.
//

import Foundation

extension URLResponse {

    var isJsonResponse: Bool {
        guard let mime = self.mimeType else {
            return false
        }

        return mime == "application/json"
    }

    var error: NetworkProviderError? {
        guard let httpResponse = self as? HTTPURLResponse,
              let responseStatus = httpResponse.status else {
            return .requestFailed
        }

        if responseStatus.responseType == .serverError
            || responseStatus.responseType == .clientError {
            return .statusError(status: responseStatus)
        }

        // Note: on ConexAPI there is no mimeType
        // but in an ideal world it should be present and checked

//        if !isJsonResponse {
//            return .mimeTypeInvalid
//        }

        return nil
    }
}
