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
    
    static let busFirmImageBaseURL: URL = {
        let s = Bundle.main.object(forInfoDictionaryKey: "BusFirmImageBaseURL") as? String ?? ""
        guard let url = URL(string: s) else { fatalError("Invalid BusFirmImageBaseURL \(s)")}
        return url
    }()
    
    static let featureImageBaseURL : URL = {
        let s = Bundle.main.object(forInfoDictionaryKey: "FeatureImageBaseURL") as? String ?? ""
        guard let url = URL(string: s) else { fatalError("Invalid FeatureImageBaseURL \(s)")}
        return url
    }()
    
    
    
    static func url(_ path: String) -> String {
        let normalized = path.hasPrefix("/") ? String(path.dropFirst()) : path
        return baseURL.appendingPathComponent(normalized).absoluteString
    }
}
