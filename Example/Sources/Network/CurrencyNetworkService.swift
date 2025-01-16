//
//  CurrencyNetworkService.swift
//  NetowrkifyDemo
//
//  Created by Marcin Polak on 09/01/2023.
//

import Foundation
import Networkify
import RxSwift

protocol CurrencyNetworkService {

    func fetchAll(completionHandler: @escaping (Result<CurrenciesResponse, NetworkifyError>) -> Void)

    func fetchAll() -> Single<CurrenciesResponse>
}
