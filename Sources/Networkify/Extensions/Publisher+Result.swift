//
//  Created by Marcin Polak on 18/01/2025.
//

import Combine

public extension Publisher {
    
    func asResult() -> AnyPublisher<Result<Output, NetworkifyError>, Never> {
        self
            .map(Result.success)
            .catch { error in
                if let error = error as? NetworkifyError {
                    return Just(Result<Output, NetworkifyError>.failure(error))
                }
                
                return Just(Result<Output, NetworkifyError>.failure(NetworkifyError.unknown(error)))
            }
            .eraseToAnyPublisher()
    }
}
