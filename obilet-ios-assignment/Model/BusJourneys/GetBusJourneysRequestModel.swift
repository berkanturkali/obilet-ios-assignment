//

import Foundation

struct GetBusJourneysRequestModel: Codable {
    let originId: Int
    let destinationId: Int
    let departureDate: String
    
    enum CodingKeys: String, CodingKey {
        case originId = "origin-id"
        case destinationId = "destination-id"
        case departureDate = "departure-date"
    }
}
