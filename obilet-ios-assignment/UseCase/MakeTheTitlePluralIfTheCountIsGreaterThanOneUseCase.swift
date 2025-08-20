//

import Foundation

class MakeTheTitlePluralIfTheCountIsGreaterThanOneUseCase {
    static let PLURAL_SUFFIX = "s"
    static let PLURAL_FORM_OF_CHILD = "Children"
    static let PLURAL_SUFFIX_THE_WORDS_THAT_ENDS_WITH_Y = "ies"
    static let CHILD = "Child"
    
    static func callAsFunction(count: Int, title: String) -> String {
        if(count > 1) {
            if(title.lowercased() == CHILD.lowercased()) {
                return PLURAL_FORM_OF_CHILD
            } else if(title.hasSuffix("y")) {
                return String(title.dropLast()) + PLURAL_SUFFIX_THE_WORDS_THAT_ENDS_WITH_Y
            } else {
                return title + PLURAL_SUFFIX
            }
        } else {
            return title
        }
    }
}
