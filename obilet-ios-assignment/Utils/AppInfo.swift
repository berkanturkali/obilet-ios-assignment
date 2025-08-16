//

import Foundation


enum AppInfo {
    static let versionName: String = {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "0.0"
    }()
    
    static let versionCode: String = {
        Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "0"
    }()
}
