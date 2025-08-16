//

import Foundation
import UIKit

struct GetUniqueDeviceIdentifierUseCase {
    
    static func callAsFunction() -> String {
        UIDevice.current.identifierForVendor?.uuidString ?? UUID().uuidString
    }
}
