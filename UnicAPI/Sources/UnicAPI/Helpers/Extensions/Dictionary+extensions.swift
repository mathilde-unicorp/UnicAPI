//
//  Dictionary+extensions.swift
//
//
//  Created by Ressier Mathilde on 07/02/2023.
//

import Foundation

extension Dictionary where Key == String, Value == Any {
    var queryItems: [URLQueryItem] {
        self.map { key, value in
            URLQueryItem(name: key, value: String(describing: value))
        }
    }

    /// Return a new dictionary with right dictionary and left dictionary content added.
    /// If keys are redundant on right dictionnary, it will override left side keys.
    static func + (left: [Key: Value], right: [Key: Value]) -> [Key: Value] {
        var result = left

        right.forEach { (key, value) in
            result[key] = value
        }

        return result
    }

    static func + (left: [Key: Value], right: [Key: Value]?) -> [Key: Value] {
        if let right = right {
            return left + right
        } else {
            return left
        }
    }
}
