//

import Foundation

class RemoveParanthesesFromTheTitleUseCase {
    
    static func callAsFunction(title: String) -> String {
        return title.components(separatedBy: " (").first ?? title
    }
}
