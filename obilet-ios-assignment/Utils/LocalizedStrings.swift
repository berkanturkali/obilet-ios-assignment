//

import Foundation

struct LocalizedStrings {
    static var busTabLabel: String {
        return localizedString(for: "bus_tab_label")
    }
    
    static var planeTabLabel: String {
        return localizedString(for: "plane_tab_label")
    }
    
    static var originLabel: String {
        return localizedString(for: "origin_label")
    }
    
    static var targetDestinationLabel: String {
        return localizedString(for: "target_destination_label")
    }
    
    static var dateLabel: String {
        return localizedString(for: "date_label")
    }
    
    static var today: String {
        return localizedString(for: "today")
    }
    
    static var tomorrow: String {
        return localizedString(for: "tomorrow")
    }
    
    static var findTheTicket: String {
        return localizedString(for: "find_ticket")
    }
    
    static var loremDummy: String {
        return localizedString(for: "lorem_dummy")
    }
    
    static func localizedString(for key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
}
