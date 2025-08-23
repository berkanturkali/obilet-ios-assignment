//

import Foundation

struct GetSessionRequestModel: Codable {
    let type: Int?
    let connection: Connection?
    let application: Application?
}

struct Connection: Codable {
    let ipAddress: String
    
    enum CodingKeys: String, CodingKey {
        case ipAddress = "ip-address"
    }
}

struct Application: Codable {
    let version: String?
    let equipmentId: String?
    
    enum CodingKeys: String, CodingKey {
        case version
        case equipmentId = "equipment-id"
    }
}
