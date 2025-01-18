//
//  Created by Marcin Polak on 09/01/2023.
//

import Foundation

public class DecodableNetworkifyResponseHandler<T: Decodable>: NetworkifyResponseHandler<T> {

    override public init() {}
    
    override public func handle(_ httpResponse: HTTPResponse) throws(NetworkifyError) -> T {
        guard let httpURLResponse = httpResponse.httpURLResponse, 200..<300 ~= httpURLResponse.statusCode else {
            throw NetworkifyError.network(httpResponse)
        }

        guard let data = httpResponse.data else {
            throw NetworkifyError.noData(httpResponse)
        }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkifyError.decoding(error, httpResponse)
        }
    }
}
