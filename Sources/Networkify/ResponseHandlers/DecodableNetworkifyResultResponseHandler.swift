//
//  Created by Marcin Polak on 09/01/2023.
//

import Foundation

public class DecodableNetworkifyResultResponseHandler<T: Decodable>: NetworkifyResultResponseHandler<T> {
    override public init() {}

    override public func handle(_ httpResponse: HTTPResponse) -> Result<T, NetworkifyError> {
        do {
            let handler = DecodableNetworkifyResponseHandler<T>()
            return try .success(handler.handle(httpResponse))
        } catch {
            return .failure(error)
        }
    }
}
