//

import Foundation

enum PassengerFilter: String, CaseIterable {
    
    case adult, student, child, baby, elder
    
    var title: String {
        switch self {
        case .adult: return LocalizedStrings.adult
        case .student: return LocalizedStrings.studentPassenger
        case .child: return LocalizedStrings.childPassenger
        case .baby: return LocalizedStrings.babyPassenger
        case .elder: return LocalizedStrings.elderlyPassenger
        }
    }
    
    var isAdult: Bool {
        switch self {
        case .adult, .elder:
            return true
        default:
            return false
        }
    }
    
    var defaultCount: Int {
        self == .adult ? 1 : 0
    }
    
    var sortIndex: Int {
        switch self {
        case .adult: return 0
        case .student: return 1
        case .child: return 2
        case .baby: return 3
        case .elder: return 4
        }
    }
    
}
