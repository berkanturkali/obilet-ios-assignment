//

import Foundation

enum Day: CaseIterable {
    case today
    case tomorrow
    case other

    var title: String {
        switch self {
        case .today:
            return LocalizedStrings.today
        case .tomorrow:
            return LocalizedStrings.tomorrow
        case .other:
            return "Other"
        }
    }
}
