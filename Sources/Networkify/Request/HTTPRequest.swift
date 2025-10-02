//
//  Created by Marcin Polak on 07/01/2023.
//

import Foundation

public protocol HTTPRequest {
    var url: URL { get }

    var headers: [String: String] { get }

    var method: HTTPMethod { get }

    var path: String? { get }
}

public extension HTTPRequest {
    var urlRequest: URLRequest? {
        var request = URLRequest(url: url)
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)

        if let path = path {
            components?.path.append(path)
        }

        switch method {
        case let .post(data),
             let .put(data):
            request = URLRequest(url: components?.url ?? url)
            request.httpBody = data
        case let .postDataForm(formData):
            let body = formData.percentEncoded()
            request = URLRequest(url: components?.url ?? url)
            request.httpBody = body
        case let .get(queryItems):
            components?.queryItems = queryItems
            request = URLRequest(url: components?.url ?? url)
        case let .multipart(data):
            request = URLRequest(url: components?.url ?? url)
            request.httpBody = data
        default:
            request = URLRequest(url: components?.url ?? url)
        }

        request.allHTTPHeaderFields = headers
        request.httpMethod = method.name
        return request
    }
}

public extension HTTPRequest {
    var headers: [String: String] {
        [:]
    }

    var method: HTTPMethod {
        .get([])
    }

    var path: String? {
        nil
    }
}
