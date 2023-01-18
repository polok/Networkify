//
//  Created by Marcin Polak on 09/01/2023.
//

import Foundation

public class HTTPResponse {
    
    public let urlRequest: URLRequest
    public let data: Data?
    public let httpURLResponse: HTTPURLResponse?
    public let error: Swift.Error?
    
    public init(
        urlRequest: URLRequest,
        data: Data?,
        httpURLResponse: HTTPURLResponse?,
        error: Swift.Error?) {
        self.urlRequest = urlRequest
        self.data = data
        self.httpURLResponse = httpURLResponse
        self.error = error
    }
}
