//

import Foundation

import Foundation

struct BusLocationDTO: Codable, Equatable, Identifiable {
    let id: Int?
    let parentId: Int?
    let type: String?
    let name: String?
    let zoom: Int?
    let tzCode: String?
    let weatherCode: String?
    let rank: Int?
    let referenceCode: String?
    let cityId: Int?
    let referenceCountry: String?
    let countryId: Int?
    let keywords: String?
    var cityName: String?
    let countryName: String?
    let longName: String?
    let geoLocation: GeoLocationDTO?

    enum CodingKeys: String, CodingKey {
        case id
        case parentId = "parent-id"
        case type
        case name
        case zoom
        case tzCode = "tz-code"
        case weatherCode = "weather-code"
        case rank
        case referenceCode = "reference-code"
        case cityId = "city-id"
        case referenceCountry = "reference-country"
        case countryId = "country-id"
        case keywords
        case cityName = "city-name"
        case countryName = "country-name"
        case longName = "long-name"
        case geoLocation = "geo-location"
    }
}

struct GeoLocationDTO: Codable, Equatable {
    let latitude: Double?
    let longitude: Double?
}
