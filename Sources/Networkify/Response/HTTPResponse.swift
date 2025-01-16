//
//  Created by Marcin Polak on 09/01/2023.
//

import Foundation

public class HTTPResponse {

    // MARK: - Properties

    public let urlRequest: URLRequest
    public let data: Data?
    public let httpURLResponse: HTTPURLResponse?
    public let error: Swift.Error?

    // MARK: - Initializers

    init(builder: HTTPResponseBuilder) {
        self.urlRequest = builder.urlRequest
        self.data = builder.data
        self.httpURLResponse = builder.httpURLResponse
        self.error = builder.error
    }
}

class HTTPResponseBuilder {

    // MARK: - Properties

    let urlRequest: URLRequest
    var data: Data?
    var httpURLResponse: HTTPURLResponse?
    var error: Swift.Error?

    init(urlRequest: URLRequest) {
        self.urlRequest = urlRequest
    }

    @discardableResult
    func with(data: Data?) -> Self {
        self.data = data
        return self
    }

    @discardableResult
    func with(httpURLResponse: HTTPURLResponse?) -> Self {
        self.httpURLResponse = httpURLResponse
        return self
    }

    @discardableResult
    func with(error: Swift.Error?) -> Self {
        self.error = error
        return self
    }

    func build() -> HTTPResponse {
        HTTPResponse(builder: self)
    }
}
