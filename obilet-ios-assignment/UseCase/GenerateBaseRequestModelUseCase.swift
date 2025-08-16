//

import Foundation

class GenerateBaseRequestModelUseCase {
    
    static func callAsFunction<T>(data: T?) -> BaseRequestModelDTO<T?> {
        return BaseRequestModelDTO(
            deviceSessionDTO: DeviceSessionDTO(
                sessionId: SessionStorageManager.shared
                    .getSessionId(),
                deviceId: SessionStorageManager.shared
                    .getDeviceId()
            ),
            date: GenerateDateForBaseRequestModelUseCase.callAsFunction(),
            language: GetDeviceLanguageUseCase.callAsFunction(),
            data: data
        )
    }
    
}
