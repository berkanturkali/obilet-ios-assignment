//

import Foundation

enum AuthHeader {
    static let name = "Authorization"
    static let prefix = "Basic"
    static let apiToken = "JEcYcEMyantZV095WVc3G2JtVjNZbWx1"
    static var tokenWithPrefix: String {
        return "\(prefix) \(apiToken)"
    }
}
