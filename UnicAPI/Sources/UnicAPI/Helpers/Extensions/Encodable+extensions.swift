//
//  Encodable+extensions.swift
//
//
//  Created by Ressier Mathilde on 07/02/2023.
//

import Foundation

extension Encodable {

    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }

    var stringDictionary: [String: String]? {
        dictionary.flatMap({ $0 as? [String: String] })
    }

    func data(ofType contentType: ContentType) -> Data? {
        switch contentType {
        case .json:
            return try? JSONEncoder().encode(self)
        case .xwwwFormUrlEncoded:
            return try? XWWWFormUrlEncoder().encode(self)
        }
    }
}
