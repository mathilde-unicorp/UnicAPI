//
//  File.swift
//
//
//  Created by Ressier Mathilde on 07/02/2023.
//

import Foundation

extension URLRequest {
    mutating func configure(with headers: Encodable) {
        headers.stringDictionary?.forEach { (key, value) in
            self.addValue(value, forHTTPHeaderField: key)
        }
    }

    mutating func setContentType(_ contentType: ContentType?) {
        if let type = contentType {
            self.setValue(type.rawValue, forHTTPHeaderField: "Content-Type")
        }
    }

    func debug() {
        log.info("🌍 Request URL: \"\(String(describing: self))\"")
        log.info("🌍 Request HTTP Method: \"\(String(describing: self.httpMethod))\"")
        log.info("🌍 Request Header: \"\(String(describing: self.allHTTPHeaderFields))\"")
        if let body = self.httpBody, let bodyString = String(data: body, encoding: .utf8) {
            log.info("🌍 Request Body: \(bodyString)")
        }
    }
}
