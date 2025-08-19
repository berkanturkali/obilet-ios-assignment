//

import Foundation

struct PassengerFilterItem: Identifiable, Equatable {
    let id = UUID()
    let filter: PassengerFilter
    var count: Int
    var canIncrease: Bool
    var canDecrease: Bool
    
    static func getFilterList() -> [PassengerFilterItem] {
        PassengerFilter.allCases.map { filter in
            PassengerFilterItem(
                filter: filter,
                count: filter.defaultCount,
                canIncrease: true,
                canDecrease: false
            )
        }
    }
    
    mutating func updateCanIncrease(canIncrease: Bool) {
        self.canIncrease = canIncrease
    }
    
    mutating func updateCanDecrease(canDecrease: Bool) {
        self.canDecrease = canDecrease
    }
}
