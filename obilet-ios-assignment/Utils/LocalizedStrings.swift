//

import Foundation

struct LocalizedStrings {
    static var busTabLabel: String {
        return localizedString(for: "bus_tab_label")
    }
    
    static var planeTabLabel: String {
        return localizedString(for: "plane_tab_label")
    }
    
    static func localizedString(for key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
}
