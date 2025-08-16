//

import Foundation

@MainActor
class FlightSectionViewModel: ObservableObject {
    
    @Published
    var selectedOriginAndTargetDestination: OriginAndTargetDestionation? = OriginAndTargetDestionation()
    
    func swipeOriginAndTargetDestination() {
        guard var selected = selectedOriginAndTargetDestination else { return }
        swap(&selected.origin, &selected.target)
        selectedOriginAndTargetDestination = selected
    }
    
}
