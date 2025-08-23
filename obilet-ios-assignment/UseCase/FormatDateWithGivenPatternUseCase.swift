//

import Foundation

struct FormatDateWithTheGivenPatternUseCase {
    static let defaultPattern = "dd MMMM EEEE"
    
    static func callAsFunction(date: Date, pattern: String = defaultPattern) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = pattern
        formatter.locale = Locale.current
        return formatter.string(from: date)
    }
}
