//
//  Created by Marcin Polak on 09/01/2023.
//

import Foundation

open class NetworkifyResponseHandler<T> {

    func handle(_ httpResponse: HTTPResponse) -> Result<T, NetworkifyError> {
        fatalError("It has to be overriden")
    }
}
