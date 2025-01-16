//
//  Created by Marcin Polak on 25/01/2023.
//

import Foundation
import Networkify
import RxSwift

extension Networkify: ReactiveCompatible {}

public extension Reactive where Base: Networkify {

    func request<T>(
        _ request: HTTPRequest,
        responseHandler: NetworkifyResponseHandler<T>,
        queue: DispatchQueue = .main) -> Single<T> {
            Single.create { single in
                let task = self.base.request(
                    request,
                    responseHandler: responseHandler,
                    queue: queue) { result in

                    switch result {
                    case let .success(response):
                        single(.success(response))
                    case let .failure(error):
                        single(.error(error))
                    }
                }

                return Disposables.create {
                    task?.cancel()
                }
            }
        }
}
