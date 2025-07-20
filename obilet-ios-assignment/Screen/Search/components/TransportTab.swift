//

import Foundation

enum TransportTab: String, CaseIterable {
    
    case bus
    case plane
    
    
    var icon: String {
        switch self {
        case .bus:
            return "bus"
        case .plane:
            return "airplane"
        }
    }
    
    var title: String {
        switch self {
        case .bus:
            return LocalizedStrings.busTabLabel
        case .plane:
            return LocalizedStrings.planeTabLabel
        }
    }
}
