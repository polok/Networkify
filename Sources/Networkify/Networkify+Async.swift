//
//  Created by Marcin Polak on 18/01/2025.
//

import Foundation

public extension Networkify {

    func request<T>(
        _ request: HTTPRequest,
        responseHandler: NetworkifyResultResponseHandler<T>) async throws -> Result<T, NetworkifyError> {

            guard let urlRequest = request.urlRequest else {
                throw NetworkifyError.invalidURLRequest(request)
            }

            let (data, response) = try await session.data(for: urlRequest)
            let httpResponse = HTTPResponseBuilder(urlRequest: urlRequest)
                .with(data: data)
                .with(httpURLResponse: response as? HTTPURLResponse)
                .build()

            return responseHandler.handle(httpResponse)
        }
}
