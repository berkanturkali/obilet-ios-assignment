//

import Foundation

struct BaseRequestModelDTO<T: Codable>: Codable {
    let deviceSessionDTO: DeviceSessionDTO?
    var date: String?
    var language: String?
    var data: T?

    enum CodingKeys: String, CodingKey {
        case deviceSessionDTO = "device-session"
        case date
        case language
        case data
    }
}
