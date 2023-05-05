//
//  File.swift
//
//
//  Created by Ressier Mathilde on 07/02/2023.
//

import Foundation

// MARK: - Date with tools to be encoded/decoded with JSONDecoder()

class JSONWithDateDecoder: JSONDecoder {
    override init() {
        super.init()
        dateDecodingStrategy = .customISO8601
    }
}

// MARK: - Formatter

extension Formatter {
    static let iso8601withFractionalSeconds: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter
    }()

    static let iso8601: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime]
        return formatter
    }()

    static let yearMonthDay: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        return formatter
    }()
}

// MARK: Encoder / Decoder

extension JSONDecoder.DateDecodingStrategy {
    static let customISO8601 = custom {
        let container = try $0.singleValueContainer()
        let string = try container.decode(String.self)
        if let date = Formatter.iso8601withFractionalSeconds.date(from: string) {
            return date
        }
        if let date = Formatter.iso8601.date(from: string) {
            return date
        }
        if let date = Formatter.yearMonthDay.date(from: string) {
            return date
        }
        throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid date: \(string)")
    }
}

extension JSONEncoder.DateEncodingStrategy {
    static let customISO8601 = custom {
        var container = $1.singleValueContainer()
        try container.encode(Formatter.iso8601withFractionalSeconds.string(from: $0))
    }
}
