//
//  ViewController.swift
//  NetowrkifyDemo
//
//  Created by Marcin Polak on 07/01/2023.
//

import UIKit
import RxSwift
import Combine

class ViewController: UIViewController {

    private let disposeBag = DisposeBag()
    private var anyCancellable: AnyCancellable?

    private let currencyNetworkService: CurrencyNetworkService = ConcreteCurrencyNetworkService(
            baseURL: URL(string: "https://cdn.jsdelivr.net/npm/@fawazahmed0/currency-api@")!
    )

    override func viewDidLoad() {
        super.viewDidLoad()
//        
//        Task { @MainActor in
//            switch (try await currencyNetworkService.fetchAll()) {
//            case .success(let response):
//                debugPrint("ASYNC-SUCCESS: \(response)")
//            case .failure(let error):
//                debugPrint("ASYNC-ERROR: \(error)")
//            }
//        }
//        anyCancellable = currencyNetworkService
//            .fetchAll()
//            .sink {
//                switch $0 {
//                case .success(let response):
//                    debugPrint("COMBINE-SUCCESS: \(response)")
//                case .failure(let error):
//                    debugPrint("COMBINE-ERROR: \(error)")
//                }
//            }

        currencyNetworkService
            .fetchAll()
            .subscribe(
                onSuccess: { response in
                    debugPrint("RX-SUCCESS: \(response)")
                }, onError: { error in
                    debugPrint("RX-ERROR: \(error)")
                })
            .disposed(by: disposeBag)

//        currencyNetworkService.fetchAll { result in
//            switch result {
//            case .success(let response):
//                debugPrint("SUCCESS: \(response)")
//            case .failure(let error):
//                debugPrint("ERROR: \(error)")
//            }
//        }
    }
}
