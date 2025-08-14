//
//  CurrencyNetworkService.swift
//  NetowrkifyDemo
//
//  Created by Marcin Polak on 09/01/2023.
//

import Combine
import Foundation
import Networkify
import RxSwift

protocol CurrencyNetworkService {
    func fetchAll(completionHandler: @escaping (Result<CurrenciesResponse, NetworkifyError>) -> Void)

    func fetchAll() -> Single<CurrenciesResponse>

    func fetchAll() -> AnyPublisher<Result<CurrenciesResponse, NetworkifyError>, Never>

    func fetchAll() async throws -> Result<CurrenciesResponse, NetworkifyError>
}
