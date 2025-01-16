//
//  CurrenciesRequest.swift
//  NetowrkifyDemo
//
//  Created by Marcin Polak on 09/01/2023.
//

import Foundation
import Networkify

struct CurrenciesRequest: HTTPRequest {

    var url: URL
    var method: HTTPMethod = .get([])

    var path: String? {
        "\(date.asString)/v1/currencies.json"
    }

    private let date: CurrencyDate

    init(url: URL, date: CurrencyDate) {
        self.url = url
        self.date = date
    }
}
