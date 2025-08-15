//
//  HTTPRequestUnitTests.swift
//  Networkify
//
//  Created by Marcin Polak on 14/08/2025.
//

import Nimble
import XCTest

@testable import Networkify

final class HTTPRequestUnitTests: XCTestCase {
    func testUrlRequestHasValidPathForPostDataFormMethod() {
        // Given
        let signInRequest = SignInHTTPRequest()

        // When
        let urlRequest = signInRequest.urlRequest

        // Then
        expect(urlRequest).notTo(beNil())
        expect(urlRequest?.url!.absoluteString).to(equal("http://example.api.com/v1/signin"))
    }
}

struct SignInHTTPRequest: HTTPRequest {
    var url: URL = .init(string: "http://example.api.com/v1")!
    var method: HTTPMethod = .postDataForm(["test": "test"])
    var path: String? {
        "/signin"
    }
}
