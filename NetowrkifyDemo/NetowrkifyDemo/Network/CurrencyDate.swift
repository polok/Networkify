//
//  CurrencyRequestDate.swift
//  NetowrkifyDemo
//
//  Created by Marcin Polak on 12/01/2023.
//

import Foundation

enum CurrencyDate {
    case latest
    case custom(Date)

    var asString: String {
        switch self {
        case .latest:
            return "latest"
        case .custom(let date):
            let formatter = ISO8601DateFormatter()
            formatter.formatOptions = [.withFullDate]
            return formatter.string(from: date)
        }
    }
}
