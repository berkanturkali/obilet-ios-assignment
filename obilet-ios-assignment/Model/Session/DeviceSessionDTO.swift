//

import Foundation

struct DeviceSessionDTO: Codable {
    let sessionId: String?
    let deviceId: String?
    
    enum CodingKeys: String, CodingKey {
        case sessionId = "session-id"
        case deviceId = "device-id"
    }
}
