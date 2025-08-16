//

import Foundation

@MainActor
class BusSectionViewModel: ObservableObject {
    
    @Published
    var selectedOriginAndTargetDestination: OriginAndTargetDestionation? = OriginAndTargetDestionation()
    
    func swipeOriginAndTargetDestination() {
        guard var selected = selectedOriginAndTargetDestination else { return }
        swap(&selected.origin, &selected.target)
        selectedOriginAndTargetDestination = selected
    }
    
}
