//

import Foundation

@MainActor
class FlightSectionSelectPassengerViewModel: ObservableObject {
    
    @Published var passengerFilters: [PassengerFilterItem] = PassengerFilterItem.getFilterList()
    
    @Published var isIncrementing: Bool = false
    
    func createAdultListFromFilterList(filterList: [PassengerFilterItem]) -> [PassengerFilterItem] {
        return filterList.filter { item in
            item.filter.isAdult
        }
    }
    
    func getSumOfAdultsInTheAdultList(adultList: [PassengerFilterItem]) -> Int {
        adultList.reduce(0) { $0 + $1.count }
    }
    
    func setBabyItemCanDecreaseIfCountOfTheBabyItemGreaterThanZero(babyItem: PassengerFilterItem) -> Bool {
        return babyItem.count > 0
    }
    
    func findTheIndexOfBabyItemFromTheList(
        filterList: [PassengerFilterItem],
        babyItem: PassengerFilterItem
    ) -> Int {
        filterList.firstIndex(of: babyItem)!
    }
    
    func setBabyItemCanIncreaseIfCountOfTheBabyItemLessThanSumOfAdults(
        babyItem: PassengerFilterItem,
        sumOfAdults: Int
    ) -> Bool {
        return babyItem.count < sumOfAdults
    }
    
    func saveTheModifiedItemToTheFilterList(
        filterList: inout [PassengerFilterItem],
        indexOfItem: Int,
        item: PassengerFilterItem
    ) {
        filterList[indexOfItem] = item
    }
    
    func setTheAdultItemsCanIncreaseDecrease(
        adultList: inout [PassengerFilterItem],
        filterList: inout [PassengerFilterItem],
        sumOfAdults: Int,
        babyItem: PassengerFilterItem
    ) {
        for index in adultList.indices {
            let canDecrease = adultList[index].count > 0 && babyItem.count < sumOfAdults
            adultList[index].updateCanDecrease(canDecrease: canDecrease)

            if let filterIndex = filterList.firstIndex(where: { $0.filter == adultList[index].filter }) {
                filterList[filterIndex] = adultList[index]
            }
        }
    }
    
    func getSumOfItemsFromFilterListExceptBabyItem(_ filterList: [PassengerFilterItem]) -> Int {
        return filterList
            .filter { $0.filter != .baby }
            .reduce(0) { $0 + $1.count }
    }
}
