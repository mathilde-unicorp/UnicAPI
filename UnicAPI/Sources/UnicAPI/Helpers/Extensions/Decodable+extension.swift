//
//  Decodable+extension.swift
//
//
//  Created by Ressier Mathilde on 08/02/2023.
//

import Foundation

extension Decodable {
    func decode<T>(_ type: T.Type) -> T? where T: Decodable {
        do {
            let data = try JSONSerialization.data(withJSONObject: self, options: .fragmentsAllowed)
            return try JSONDecoder().decode(type, from: data)
        } catch {
            print("Decode error: \(error)")
            return nil
        }
    }

    func decode<T>() -> T? where T: Decodable {
        return self.decode(T.self)
    }
}
