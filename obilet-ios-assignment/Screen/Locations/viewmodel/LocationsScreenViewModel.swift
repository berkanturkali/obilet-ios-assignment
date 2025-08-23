//

import Foundation
import Combine

@MainActor
class LocationsScreenViewModel: ObservableObject {
    
    @Published var searchQuery: String = ""
    
    @Published var locations: [BusLocationDTO] = []
    
    var allLocations: [BusLocationDTO] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    private let debounceDuration: TimeInterval = 0.3
    
    init(initialLocations: [BusLocationDTO] = []) {
        self.allLocations = initialLocations
        self.locations = initialLocations
        bindSearch()
    }
    
    private func bindSearch() {
        $searchQuery
            .debounce(
                for: .seconds(
                    debounceDuration
                ),
                scheduler: DispatchQueue.main
            )
            .map { [weak self] query -> [BusLocationDTO] in
                guard let self = self else { return [] }
                
                let trimmed = query.trimmingCharacters(in: .whitespacesAndNewlines)
                return trimmed.isEmpty
                    ? self.allLocations
                    : self.findListItem(by: trimmed)
            }
            .receive(on: DispatchQueue.main)
            .assign(to: \.locations, on: self)
            .store(in: &cancellables)
    }
    
    private func findListItem(by query: String) -> [BusLocationDTO] {
        return allLocations.filter {
            $0.name?.lowercased().contains(query.lowercased()) ?? false
        }
    }
    
}
