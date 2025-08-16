//

import Foundation


class GenerateDateForBaseRequestModelUseCase {
    
    static func callAsFunction(pattern: String = "yyyy-MM-dd'T'HH:mm:ss") -> String? {
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = pattern
        formatter.locale = Locale.current
        
        return formatter.string(from: now)
    }
}
