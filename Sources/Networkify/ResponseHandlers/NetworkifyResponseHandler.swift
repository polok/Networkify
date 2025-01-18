//
//  Created by Marcin Polak on 09/01/2023.
//

import Foundation

open class NetworkifyResponseHandler<T> {
    
    func handle(_ httpResponse: HTTPResponse) throws -> T {
        fatalError("It has to be overriden")
    }
}
