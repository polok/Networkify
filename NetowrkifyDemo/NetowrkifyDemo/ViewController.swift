//
//  ViewController.swift
//  NetowrkifyDemo
//
//  Created by Marcin Polak on 07/01/2023.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    private let disposeBag = DisposeBag()

    private let currencyNetworkService: CurrencyNetworkService = ConcreteCurrencyNetworkService(
            baseURL: URL(string: "https://cdn.jsdelivr.net/gh/fawazahmed0/currency-apri@1/")!
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyNetworkService
            .fetchAll()
            .subscribe(
                onSuccess: { response in
                    debugPrint("RX-SUCCESS: \(response)")
                }, onError: { error in
                    debugPrint("RX-ERROR: \(error)")
            })
            .disposed(by: disposeBag)

        currencyNetworkService.fetchAll(completionHandler: { result in
            switch result {
            case .success(let response):
                debugPrint("SUCCESS: \(response)")
            case .failure(let error):
                debugPrint("ERROR: \(error)")
            }
        })
    }
}

