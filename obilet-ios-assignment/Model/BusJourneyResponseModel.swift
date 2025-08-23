//

import Foundation


struct BusJourneyResponseModel: Codable, Identifiable {
    
    let id: Int?
    let partnerId: Int?
    let partnerName: String?
    let routeId: Int?
    let busType: String?
    let busTypeName: String?
    let totalSeats: Int?
    let availableSeats: Int?
    let journey: JourneyDTO?
    let features: [FeatureDTO]?
    let originLocation: String?
    let destinationLocation: String?
    let originLocationId: Int?
    let destinationLocationId: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case partnerId = "partner-id"
        case partnerName = "partner-name"
        case routeId = "route-id"
        case busType = "bus-type"
        case busTypeName = "bus-type-name"
        case totalSeats = "total-seats"
        case availableSeats = "available-seats"
        case journey
        case features
        case originLocation = "origin-location"
        case destinationLocation = "destination-location"
        case originLocationId = "origin-location-id"
        case destinationLocationId = "destination-location-id"
    }
    
}

struct FeatureDTO: Codable, Identifiable {
    let id: Int?
    let name: String?
    
    var  imageURL: String {
        APIConfig.featureImageBaseURL.absoluteString + "\(String(describing: self.id ?? 0)).svg"
    }
    
    static var mockList: [FeatureDTO] {
        [
            .init(id: 1, name: "Feature1"),
            .init(id: 2, name: "Feature2"),
            .init(id: 3, name: "Feature3"),
            .init(id: 4, name: "Feature4")
        ]
    }
}

struct JourneyDTO: Codable {
    let kind: String?
    let code: String?
    let stops: [StopDTO]?
    let origin: String?
    let destination: String?
    let departure: String?
    let arrival: String?
    let currency: String?
    let duration: String?
    let originalPrice: Double?
    let internetPrice: Double?
    let busName: String?
    
    enum CodingKeys: String, CodingKey {
        case kind
        case code
        case stops
        case origin
        case destination
        case departure
        case arrival
        case currency
        case duration
        case originalPrice = "original-price"
        case internetPrice = "internet-price"
        case busName = "bus-name"
    }
    
    func formatThePrice(price: String?, currencyCode: String?) -> String? {
        guard let price = price else { return nil }
        
        if let code = currencyCode, let currency = Currency(rawValue: code) {
            return price + currency.symbol
        } else {
            return price
        }
    }
    
    func formatDurationForDisplay(_ time: String?) -> String? {
        guard let time = time else { return nil }

        // Expect "HH:mm" (e.g., "05:00", "07:45"). Adjust if your backend differs.
        let parts = time.split(separator: ":")
        guard parts.count >= 2,
              let hours = Int(parts[0]),
              let minutes = Int(parts[1]) else { return nil }

        if minutes == 0 {
            return String(format: LocalizedStrings.durationHoursOnly, hours)
        } else {
            return String(format: LocalizedStrings.durationHoursAndMinutes, hours, minutes)
        }
    }
}

struct StopDTO: Codable {
    var id: Int? = nil
    var carLocationId: Int? = nil
    var name: String? = nil
    var station: String? = nil
    var time: String? = nil
    var isOrigin: Bool? = nil
    var isDestination: Bool? = nil
    var isSegmentStop: Bool? = nil
    
    enum CodingKeys: String, CodingKey {
        case id
        case carLocationId = "kolayCarLocationId"
        case name
        case station
        case time
        case isOrigin = "is-origin"
        case isDestination = "is-destination"
        case isSegmentStop = "is-segment-stop"
    }
}

enum Currency: String, CaseIterable {
    case TRY = "TRY"
    case USD = "USD"
    case EUR = "EUR"
    
    var symbol: String {
        switch self {
        case .TRY: return "₺"
        case .USD: return "$"
        case .EUR: return "€"
        }
    }
}
