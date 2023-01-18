//
//  Created by Marcin Polak on 09/01/2023.
//

import Foundation

public final class DecodableNetworkifyResponseHandler<T: Decodable>: NetworkifyResponseHandler<T> {

    public override init() {}

    public override func handle(_ httpResponse: HTTPResponse) -> Result<T, NetworkifyError> {
        guard let httpURLResponse = httpResponse.httpURLResponse, 200..<300 ~= httpURLResponse.statusCode else {
            return .failure(.network(httpResponse))
        }

        guard let data = httpResponse.data else {
            return .failure(.noData(httpResponse))
        }

        do {
            let object = try JSONDecoder().decode(T.self, from: data)
            return .success(object)
        } catch {
            return .failure(.decoding(error, httpResponse))
        }
    }
}
