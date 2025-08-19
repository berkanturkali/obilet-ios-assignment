//

import Foundation

enum PassengerFilter: CaseIterable {
    
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
    
}
