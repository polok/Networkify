//
//  Created by Marcin Polak on 09/01/2023.
//

import Foundation

open class NetworkifyResultResponseHandler<T> {
    public init() {}

    public func handle(_: HTTPResponse) -> Result<T, NetworkifyError> {
        fatalError("It has to be overriden")
    }
}
