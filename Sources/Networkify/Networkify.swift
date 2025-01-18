import Foundation

public class Networkify {

    internal lazy var session: URLSession = {
        URLSession(configuration: self.configuration)
    }()

    private let configuration: URLSessionConfiguration

    public init(configuration: URLSessionConfiguration = .default) {
        self.configuration = configuration
    }

    public func request<T>(
            _ request: HTTPRequest,
            responseHandler: NetworkifyResultResponseHandler<T>,
            queue: DispatchQueue = .main,
            completion: @escaping (Result<T, NetworkifyError>) -> Void) -> URLSessionDataTask? {

        guard let urlRequest = request.urlRequest else {
            completion(.failure(.invalidURLRequest(request)))
            return nil
        }

        let dataTask = session.dataTask(with: urlRequest) { data, urlResponse, error in
            queue.async {
                let httpResponse = HTTPResponseBuilder(urlRequest: urlRequest)
                        .with(data: data)
                        .with(httpURLResponse: urlResponse as? HTTPURLResponse)
                        .with(error: error)
                        .build()

                return completion(responseHandler.handle(httpResponse))
            }
        }

        dataTask.resume()
        return dataTask
    }
}
