//

import Foundation

struct LocationService {
    private var networkManager = NetworkManager.shared
    
    static let shared = LocationService()
    
    private init() {}
    
    
    func getBusLocations(body: BaseRequestModelDTO<String?>) async throws -> Resource<[BusLocationDTO]> {
        
        let url = APIConfig.url(LocationServiceEndpoints.getBusLocationsEndpoint)
        
        do {
            let response: Resource<[BusLocationDTO]> = try await networkManager.request(
                to: url,
                method: HttpMethod.POST,
                body: body,
                responseType: BaseResponseDTO<[BusLocationDTO]>.self
            )
            
            return response
        } catch {
            throw error
        }
    }
}
