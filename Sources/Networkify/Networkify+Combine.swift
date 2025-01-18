//
//  Created by Marcin Polak on 18/01/2025.
//

import Combine
import Foundation

public extension Networkify {

    func request<T>(
        _ request: HTTPRequest,
        responseHandler: NetworkifyResponseHandler<T>) -> AnyPublisher<Result<T, NetworkifyError>, Never> {

            guard let urlRequest = request.urlRequest else {
                return Just(.failure(NetworkifyError.invalidURLRequest(request))).eraseToAnyPublisher()
            }

            return session.dataTaskPublisher(for: urlRequest)
                .tryMap { element -> HTTPResponse in
                    HTTPResponseBuilder(urlRequest: urlRequest)
                        .with(data: element.data)
                        .with(httpURLResponse: element.response as? HTTPURLResponse)
                        .build()
                }
                .tryMap {
                    try responseHandler.handle($0)
                }
                .asResult()
        }
}
