//
//  Created by Marcin Polak on 09/01/2023.
//

import Foundation

public enum NetworkifyError: Swift.Error {
    case invalidURLRequest(HTTPRequest)
    case noData(HTTPResponse)
    case decoding(Swift.Error, HTTPResponse)
    case network(HTTPResponse)
    case unknown(Swift.Error)
}
