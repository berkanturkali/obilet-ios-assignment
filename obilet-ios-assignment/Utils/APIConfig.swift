//

import Foundation

struct APIConfig {
    
    static var outboundIpURL: String {
        Bundle.main.object(forInfoDictionaryKey: "OutboundIpURL") as? String ?? ""
    }
    
    static let baseURL: URL = {
        let s = Bundle.main.object(forInfoDictionaryKey: "BaseURL") as? String ?? ""
        guard let url = URL(string: s) else { fatalError("Invalid BaseURL \(s)")}
        return url
    }()
    
    static func url(_ path: String) -> String {
        let normalized = path.hasPrefix("/") ? String(path.dropFirst()) : path
        return baseURL.appendingPathComponent(normalized).absoluteString
    }
}
