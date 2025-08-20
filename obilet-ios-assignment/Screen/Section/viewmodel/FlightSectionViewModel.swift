//

import CoreData
import Combine

@MainActor
class FlightSectionViewModel: NSObject, ObservableObject, @preconcurrency NSFetchedResultsControllerDelegate {
    
    @Published var summaryText: String = ""
    
    @Published
    var selectedOriginAndTargetDestination: OriginAndTargetDestionation? = OriginAndTargetDestionation()
    
    private let frc: NSFetchedResultsController<PassengerFilterEntity>
    
    override init() {
        let context = PassengerFilterStorage.shared.context
        let request = PassengerFilterEntity.fetchRequest()
        
        request.sortDescriptors = []
        
        frc = NSFetchedResultsController(
            fetchRequest: request,
            managedObjectContext: context,
            sectionNameKeyPath: nil,
            cacheName: nil
        )
        
        super.init()
        frc.delegate = self
        try? frc.performFetch()
        getFilters()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        getFilters()
    }
    
    private func getFilters() {
        let entities = frc.fetchedObjects ?? []
        let text = entities
            .filter { $0.count > 0 }
            .compactMap { e -> String? in
                guard let raw = e.filter,
                      let filter = PassengerFilter(rawValue: raw) else { return nil }
                let title = filter.title
                let modified = RemoveParanthesesFromTheTitleUseCase.callAsFunction(title: title)
                if Locale.current.language.languageCode?.identifier == "en" {
                    let plural = MakeTheTitlePluralIfTheCountIsGreaterThanOneUseCase
                        .callAsFunction(count: Int(e.count), title: modified)
                    return "\(e.count) \(plural)"
                } else {
                    return "\(e.count) \(modified)"
                }
            }
            .joined(separator: ", ")
        summaryText = text
    }
    
    
    func swipeOriginAndTargetDestination() {
        guard var selected = selectedOriginAndTargetDestination else { return }
        swap(&selected.origin, &selected.target)
        selectedOriginAndTargetDestination = selected
    }
}
