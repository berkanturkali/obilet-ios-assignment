//

import Foundation

@MainActor
class SearchScreenViewModel: ObservableObject {
    
    private let locationsService = LocationService.shared
    
    private let networkManager = NetworkManager.shared
    
    @Published var isLoading: Bool = false
    
    @Published var locations: [BusLocationDTO] = []
    
    @Published var errorMessage: String? = nil
    
    @Published var originAndTargetDestination = OriginAndTargetDestionation()
    
    init() {
        Task {
            await getBusLocations()
        }
    }
    
    func getBusLocations(query: String? = nil) async {
        
        guard !isLoading else { return }
        
        let requestModel = GenerateBaseRequestModelUseCase.callAsFunction(data: query)
        
        do {
            isLoading = true
            
            let resource = try await locationsService.getBusLocations(body: requestModel)
            
            if resource is Resource.Success {
                if(resource.data != nil) {
                    locations = resource.data!
                    if(locations.count >= 2) {
                        let originAndTargetDestination = getDefaultLocationsByCityId(from: locations)
                        if(originAndTargetDestination.origin != nil && originAndTargetDestination.target != nil) {
                
                            setOriginAndTargetDestionation(originAndTargetDestination)
                        }
                    }
                }
            } else if resource is Resource.Error {
                errorMessage = networkManager.handleNetworkError(resource.error!)
                print("error message = \(String(describing: errorMessage))")
            }
            
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
        
    }
    
    func setOriginAndTargetDestionation(_ originAndTargetDestination: OriginAndTargetDestionation) {
        print("here")
        self.originAndTargetDestination = originAndTargetDestination
    }
    
    private func getDefaultLocationsByCityId(from locationList: [BusLocationDTO]) -> OriginAndTargetDestionation {
        let origin = locationList.first!
        let target = locationList.first { location in
            origin.cityId != location.cityId
        }
        return OriginAndTargetDestionation(origin: origin, target: target)
    }
    
}
