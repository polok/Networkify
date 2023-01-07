//
//  Created by Marcin Polak on 07/01/2023.
//

import Foundation

public protocol HTTPRequest {
    
    var url: URL { get }
    
    var headers: [String: String] { get }
        
    var method: HTTPMethod { get }

}

public extension HTTPRequest {
    
    var urlRequest: URLRequest? {
        var request = URLRequest(url: url)

        switch method {
        case .post(let data),
             .put(let data):
            request.httpBody = data
        case let .get(queryItems):
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
            components?.queryItems = queryItems
            
            guard let url = components?.url else {
                return nil
            }
            
            request = URLRequest(url: url)
        default:
            break
        }
        
        request.allHTTPHeaderFields = headers
        request.httpMethod = method.name
        return request
    }
}

public extension HTTPRequest {
    
    var headers: [String: String] {
        return [:]
    }
    
    var method: HTTPMethod {
        return .get([])
    }
}
