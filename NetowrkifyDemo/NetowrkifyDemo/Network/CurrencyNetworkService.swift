//
//  CurrencyNetworkService.swift
//  NetowrkifyDemo
//
//  Created by Marcin Polak on 09/01/2023.
//

import Foundation
import Networkify

protocol CurrencyNetworkService {
    func fetchAll(completionHandler: @escaping (Result<CurrenciesResponse, NetowrkifyError>) -> Void)
}
