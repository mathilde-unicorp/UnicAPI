//
//  File.swift
//
//
//  Created by Ressier Mathilde on 07/02/2023.
//

import Foundation

final class URLResponseFactory {

    let decoder: JSONDecoder

    init(decoder: JSONDecoder) {
        self.decoder = decoder
    }

    func decodeResponse<T: Decodable>(
        data: Data?,
        response: URLResponse?
    ) throws -> T {
        guard let httpResponse = response else {
            log.error("No response on request")
            throw NetworkProviderError.noResponse
        }

        guard let data = data else {
            log.error("No data on request result")
            throw NetworkProviderError.noData
        }

        if let error = httpResponse.error {
            log.error("Error on response request: \(httpResponse))")
            log.error("Body: \(String(describing: String(data: data, encoding: .utf8)))")
            throw error
        }

        log.debug("Body to decode: \(String(describing: String(data: data, encoding: .utf8)))")

        #if DEBUG
            if let object = try? JSONSerialization.jsonObject(with: data, options: []),
               let data2 = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]) {
                let prettyPrintedString = NSString(data: data2, encoding: String.Encoding.utf8.rawValue)
                log.debug("\(String(describing: prettyPrintedString))")
            }
        #endif

        do {
            let object = try decoder.decode(T.self, from: data)
            log.debug("Decode object: \(object)")
            return object
        } catch {
            log.error("JSON error \(error)\n\(error.localizedDescription)")
            log.error("Try to decode data: \(String(decoding: data, as: UTF8.self))")
            throw NetworkProviderError.conversionFailed(data: data)
        }
    }
}
