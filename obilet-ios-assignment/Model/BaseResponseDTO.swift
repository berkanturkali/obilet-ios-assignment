//

import Foundation

struct BaseResponseDTO<T: Codable>: Codable {
    
    let status: String?
    let data: T?
    let message: String?
    let userMessage: String?
    let apiRequestId: String?
    let controller: String?
    
    enum CodingKeys: String, CodingKey {
        case status
        case data
        case message
        case userMessage = "user-message"
        case apiRequestId = "api-request-id"
        case controller
    }
    
    var isSuccess: Bool { status?.lowercased() == "success" }
}

