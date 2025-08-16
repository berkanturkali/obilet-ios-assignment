//

import Foundation

struct NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func request<T: Encodable, U: Codable>(
        to url: String,
        method: HttpMethod,
        body: T? = nil,
        responseType: BaseResponseDTO<U>.Type = BaseResponseDTO<U>.self
    ) async throws -> Resource<U> {
        
        guard let url = URL(string: url) else {
            throw NetworkError.badURL(url)
        }
        
        do {
            var request = URLRequest(url: url)
            
            request.httpMethod = method.rawValue
            
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            request.setValue(AuthHeader.tokenWithPrefix, forHTTPHeaderField: AuthHeader.name)
            
            if let body = body {
                let jsonBody = try JSONEncoder().encode(body)
                request.httpBody = jsonBody
            }
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 500
                throw NetworkError.unknownError(statusCode: statusCode, description: LocalizedStrings.somethingWentWrong)
            }
            
            guard !data.isEmpty else {
                throw NetworkError.unknownError(statusCode: httpResponse.statusCode, description: LocalizedStrings.noResultFound)
            }
            
            let decodedResponse = try JSONDecoder().decode(responseType, from: data)
            
            print("decoded response = \(decodedResponse)")
            
            guard decodedResponse.isSuccess else {
                throw NetworkError.unknownError(statusCode: httpResponse.statusCode, description: LocalizedStrings.somethingWentWrong)
            }
            
            guard let data = decodedResponse.data else {
                throw NetworkError.unknownError(statusCode: httpResponse.statusCode, description: LocalizedStrings.somethingWentWrong)
            }
            
            return Resource.Success(data: data)
            
            
        } catch let error {
            print(error.localizedDescription)
            return Resource.Error(error: handleError(error, url: url.absoluteString))
        }
    }
    
    func handleNetworkError(_ error: NetworkError) -> String {
        switch error {
        case .badURL(let message),
                .requestFailed(let message),
                .notConnectedToInternet(let message),
                .timeOut(let message),
                .cannotConnectToHost(let message):
            return message
        case .decodingError(let underlyingError):
            return underlyingError.localizedDescription
        case .httpError(_, let localizedDescription),
                .unknownError(_, let localizedDescription):
            return localizedDescription
        }
    }
    
    private func handleError(_ error: Error, url: String) -> NetworkError {
        if let urlError = error as? URLError {
            return mapURLError(urlError, url: url)
        }
        
        if error is DecodingError {
            return NetworkError.decodingError(error)
        }
        
        return NetworkError.unknownError(statusCode: 500, description: LocalizedStrings.somethingWentWrong)
    }
    
    private func mapURLError(_ error: URLError, url: String) -> NetworkError {
        switch error.code {
        case .notConnectedToInternet:
            return .notConnectedToInternet(LocalizedStrings.checkYourConnection)
        case .timedOut:
            return .timeOut(LocalizedStrings.timeout)
        case .cannotFindHost:
            return .cannotConnectToHost(String(format: LocalizedStrings.canNotConnectToHost, url))
        default:
            return .requestFailed(error.localizedDescription)
        }
    }
}
