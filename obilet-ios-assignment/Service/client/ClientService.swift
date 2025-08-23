//

import Foundation


struct ClientService {
    
    private var networkManager = NetworkManager.shared
    
    static let shared = ClientService()
    
    private init() {}
    
    func getSession(body: GetSessionRequestModel) async throws -> Resource<GetSessionDTO> {
        let url = APIConfig.url(ClientServiceEndpoints.getSessionEndpoint)
        
        do {
            let response: Resource<GetSessionDTO> = try await networkManager.request(
                to: url,
                method: HttpMethod.POST,
                body: body
            )
            
            return response
        } catch {
            throw error
        }
    }
    
}
