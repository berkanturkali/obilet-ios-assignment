//

import Foundation

class GetDeviceLanguageUseCase {
    
    static func callAsFunction() -> String {
        let locale = Locale.current
        let languageCode = locale.language.languageCode?.identifier ?? "en"
        return "\(languageCode)-\(languageCode.uppercased())"
    }
}
