//

import Foundation

@MainActor
class BusSectionViewModel: ObservableObject {
    
    @Published
    var selectedOriginAndTargetDestination: OriginAndTargetDestionation? = OriginAndTargetDestionation()
    
    @Published
    var selectedDay = Day.other
    
    @Published
    var selectedDate: Date = Date()
    
    @Published
    var displayDate: String = ""
    
    func swipeOriginAndTargetDestination() {
        guard var selected = selectedOriginAndTargetDestination else { return }
        swap(&selected.origin, &selected.target)
        selectedOriginAndTargetDestination = selected
    }
    
}
