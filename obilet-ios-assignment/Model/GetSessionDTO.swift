//

import Foundation


struct GetSessionDTO: Codable {
    let sessionId: String?
    let deviceId: String?
    let deviceType: Int?
    let ipCountry: String?
    
    enum CodingKeys: String, CodingKey {
        case sessionId = "session-id"
        case deviceId = "device-id"
        case deviceType = "device-type"
        case ipCountry = "ip-country"
    }
}
