//

import Foundation

class JourneyService {
    
    private var networkManager = NetworkManager.shared
    static let shared = JourneyService()
    
    private init() {}
    
    func getBusJourneys(
        body: BaseRequestModelDTO<GetBusJourneysRequestModel?>
    ) async throws -> Resource<[BusJourneyResponseModel]> {
        let url = APIConfig.url(JourneyServiceEndpoints.GET_BUS_JOURNEYS_ENDPOINT)
        
        do {
            let response: Resource<[BusJourneyResponseModel]> = try await networkManager.request(
                to: url,
                method: HttpMethod.POST,
                body: body,
                responseType: BaseResponseDTO<[BusJourneyResponseModel]>.self
            )
            
            return response
        } catch {
            throw error
        }
    }
}
