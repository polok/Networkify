//
//  Created by Marcin Polak on 25/01/2023.
//

import Foundation
import Networkify
import RxSwift

extension Networkify: @retroactive ReactiveCompatible {}

public extension Reactive where Base: Networkify {

    func request<T>(
        _ request: HTTPRequest,
        responseHandler: NetworkifyResultResponseHandler<T>,
        queue: DispatchQueue = .main) -> Observable<T> {
            Observable.create { observer in
                let task = self.base.request(
                    request,
                    responseHandler: responseHandler,
                    queue: queue) { result in

                    switch result {
                    case let .success(response):
                        observer.on(.next(response))
                        observer.on(.completed)
                    case let .failure(error):
                        observer.on(.error(error))
                    }
                }

                return Disposables.create {
                    task?.cancel()
                }
            }
        }
}
