//
//  Created by Marcin Polak on 18/01/2023.
//

import Nimble
import XCTest

@testable import Networkify

final class HTTPMethodUnitTests: XCTestCase {
    
    func testGetContainsPassedURLQueryItems() {
        
        // Given
        let get: HTTPMethod
        
        // When
        get = .get([
                    URLQueryItem(name: "key_1", value: "value_1"),
                    URLQueryItem(name: "key_2", value: "value_2")
                ])
        
        // Then
        expect(get).to(beGet() { urlQueryItems in
            expect(urlQueryItems).to(haveCount(2))
            expect(urlQueryItems[0].name).to(equal("key_1"))
            expect(urlQueryItems[0].value).to(equal("value_1"))
            expect(urlQueryItems[1].name).to(equal("key_2"))
            expect(urlQueryItems[1].value).to(equal("value_2"))
        })
    }
    
    func testPutContainsPassedData() {
        
        // Given
        let put: HTTPMethod
        
        // When
        put = .put("what an awesome test".data(using: .utf32))
        
        // Then
        expect(put).to(bePut() { data in
            expect(data).to(equal("what an awesome test".data(using: .utf32)))
        })
    }
    
    func testPostContainsPassedData() {
        
        // Given
        let put: HTTPMethod
        
        // When
        put = .post("what an awesome test".data(using: .utf32))
        
        // Then
        expect(put).to(bePost() { data in
            expect(data).to(equal("what an awesome test".data(using: .utf32)))
        })
    }
    
    func testGetHasProperHTTPMethodName() {
        
        // Given
        let get: HTTPMethod
        
        // When
        get = .get([])
        
        // Then
        expect(get.name).to(equal("GET"))
    }
    
    func testPutHasProperHTTPMethodName() {
        
        // Given
        let put: HTTPMethod
        
        // When
        put = .put(nil)
        
        // Then
        expect(put.name).to(equal("PUT"))
    }
    
    func testPostHasProperHTTPMethodName() {
        
        // Given
        let post: HTTPMethod
        
        // When
        post = .post(nil)
        
        // Then
        expect(post.name).to(equal("POST"))
    }
    
    func testHeadHasProperHTTPMethodName() {
        
        // Given
        let head: HTTPMethod
        
        // When
        head = .head
        
        // Then
        expect(head.name).to(equal("HEAD"))
    }
    
    func testDeleteHasProperHTTPMethodName() {
        
        // Given
        let delete: HTTPMethod
        
        // When
        delete = .delete
        
        // Then
        expect(delete.name).to(equal("DELETE"))
    }
}

private extension HTTPMethodUnitTests {
    
    func beGet(test: @escaping ([URLQueryItem]) -> Void = { _ in }) -> Predicate<HTTPMethod> {
        return Predicate.define("be <get>") { expression, message in
            guard let httpMethod = try? expression.evaluate() else {
                return PredicateResult(status: .fail, message: message)
            }
            
            if case .get(let urlQueryItems) = httpMethod {
                test(urlQueryItems)
                return PredicateResult(status: .matches, message: message)
            }
            
            return PredicateResult(status: .fail, message: message)
        }
    }
    
    func bePut(test: @escaping (Data?) -> Void = { _ in }) -> Predicate<HTTPMethod> {
        return Predicate.simple("be <put>") { expression in
            guard let httpMethod = try? expression.evaluate() else {
                return .fail
            }
            
            if case .put(let data) = httpMethod {
                test(data)
                return .matches
            }
            
            return .fail
        }
    }
    
    func bePost(test: @escaping (Data?) -> Void = { _ in }) -> Predicate<HTTPMethod> {
        return Predicate.simple("be <post>") { expression in
            guard let httpMethod = try? expression.evaluate() else {
                return .fail
            }
            
            if case .post(let data) = httpMethod {
                test(data)
                return .matches
            }
            
            return .fail
        }
    }
}
