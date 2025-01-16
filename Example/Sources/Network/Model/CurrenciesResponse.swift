//
//  CurrenciesResponse.swift
//  NetowrkifyDemo
//
//  Created by Marcin Polak on 09/01/2023.
//

import Foundation

struct CurrenciesResponse: Decodable {

    let currencies: [String: String]

    private struct DynamicCodingKey: CodingKey {

        // Use for currency code
        var stringValue: String

        init?(stringValue: String) {
            self.stringValue = stringValue
        }

        var intValue: Int?

        init?(intValue: Int) {
            // it is not being used this, thus just return nil
            nil
        }
    }

    init(from decoder: Decoder) throws {

        // 1
        // Create a decoding container using DynamicCodingKeys
        // It will contain all currency codes
        let container = try decoder.container(keyedBy: DynamicCodingKey.self)
        var tempDict = [String: String]()

        // 2
        // Loop through each key (currency code) in container
        for key in container.allKeys {
            guard let dynamicKey = DynamicCodingKey(stringValue: key.stringValue) else {
                break
            }

            // Decode currency name using key and store the currency name under currency code in a dictionary
            let currencyDecodedName = try container.decode(String.self, forKey: dynamicKey)
            tempDict[key.stringValue] = currencyDecodedName
        }

        // 3
        // Just assign a temporary dict of currencies to currencies struct field
        currencies = tempDict
    }
}
