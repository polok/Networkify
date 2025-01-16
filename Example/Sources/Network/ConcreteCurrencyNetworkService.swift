//
//  ConcreteCurrencyNetworkService.swift
//  NetowrkifyDemo
//
//  Created by Marcin Polak on 09/01/2023.
//

import Foundation
import Networkify
import RxNetworkify
import RxSwift

class ConcreteCurrencyNetworkService: CurrencyNetworkService {

    private let networkify: Networkify
    private let baseURL: URL

    init(networkify: Networkify = .init(), baseURL: URL) {
        self.networkify = networkify
        self.baseURL = baseURL
    }

    func fetchAll(completionHandler: @escaping (Result<CurrenciesResponse, NetworkifyError>) -> Void) {
        _ = networkify.request(
            CurrenciesRequest(url: baseURL, date: .latest),
                responseHandler: DecodableNetworkifyResponseHandler<CurrenciesResponse>(),
                completion: completionHandler)
    }

    func fetchAll() -> RxSwift.Single<CurrenciesResponse> {
        networkify.rx.request(
            CurrenciesRequest(url: baseURL, date: .latest),
            responseHandler: DecodableNetworkifyResponseHandler<CurrenciesResponse>())
    }
}
