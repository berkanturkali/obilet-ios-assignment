//

import Foundation


class SessionStorageManager {
    
    static let shared = SessionStorageManager()
    
    private enum Keys {
        static let sessionId = "session_id"
        static let deviceId = "device_id"
    }
    
    private let defaults: UserDefaults
        
    private init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }
    
    func cacheSessionAndDeviceId(session: Session) {
        defaults.set(session.sessionId, forKey: Keys.sessionId)
        defaults.set(session.deviceId, forKey: Keys.deviceId)
    }
    
    func getSessionId() -> String {
        return defaults.string(forKey: Keys.sessionId) ?? ""
    }
    
    func getDeviceId() -> String {
        return defaults.string(forKey: Keys.deviceId) ?? ""
    }
    
    func clearSessionPreferences() {
        defaults.removeObject(forKey: Keys.sessionId)
        defaults.removeObject(forKey: Keys.deviceId)
    }
}
