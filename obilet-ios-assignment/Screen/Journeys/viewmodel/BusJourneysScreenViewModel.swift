//

import Foundation

@MainActor
class BusJourneysScreenViewModel: ObservableObject {
    
    @Published
    var title: String = ""
    
    @Published var isLoading: Bool = false
    
    @Published var journeys: [BusJourneyResponseModel] = []
    
    @Published var errorMessage: String? = nil
    
    private var args: BusJourneysArgs
    
    private let journeyService: JourneyService = .shared
    
    private let networkManager: NetworkManager = .shared
    
    init(args: BusJourneysArgs) {
        self.args = args
        self.title = args.originName + "\n" + args.destinationName
        
        Task {
            await getBusJourneys(
                GetBusJourneysRequestModel(
                    originId: args.originId,
                    destinationId: args.destinationId,
                    departureDate: args.departureDate
                )
            )
        }
    }
    
    func getBusJourneys(_ body: GetBusJourneysRequestModel) async {
        guard !isLoading else { return }
        
        do {
            isLoading = true
            let requestModel = GenerateBaseRequestModelUseCase.callAsFunction(data: body)
            
            let resource = try await journeyService.getBusJourneys(body: requestModel)
            
            if resource is Resource.Success {
               journeys = resource.data ?? []
            } else if resource is Resource.Error {
                errorMessage = networkManager.handleNetworkError(resource.error!)
                print("error message = \(String(describing: errorMessage))")
            }
            
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
    
}
