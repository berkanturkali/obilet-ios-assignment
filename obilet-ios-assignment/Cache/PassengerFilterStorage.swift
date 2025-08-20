//

import Foundation
import CoreData

final class PassengerFilterStorage {
    private let container: NSPersistentContainer
    
    init(container: NSPersistentContainer) {
        self.container = container
    }
    
    var context: NSManagedObjectContext {
        container.viewContext
    }
    
    
    func insertOrUpdateFilters(_ filters: [PassengerFilterItem]) {
        print("filters = \(filters)")
        for filter in filters {
            let fetchRequest: NSFetchRequest<PassengerFilterEntity> = PassengerFilterEntity.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "filter == %@", filter.filter.rawValue)
            
            let fetched = (try? context.fetch(fetchRequest))?.first
            let existing = fetched ?? PassengerFilterEntity(context: context)
            existing.filter = filter.filter.rawValue
            existing.count = Int32(filter.count)
            existing.canIncrease = filter.canIncrease
            existing.canDecrease = filter.canDecrease
            
        }
        do {
            try context.save()
        } catch {
            let nsError = error as NSError
            print("❌ Failed to save filters: \(nsError), \(nsError.userInfo)")
        }

    }
    
    func getPassengerFilters() -> [PassengerFilterItem] {
        let fetchRequest: NSFetchRequest<PassengerFilterEntity> = PassengerFilterEntity.fetchRequest()

        do {
            let entities = try context.fetch(fetchRequest)
            if entities.isEmpty {
                return PassengerFilterItem.getFilterList()
            }

            let unsorted = entities.compactMap { entity -> PassengerFilterItem? in
                guard let raw = entity.filter,
                      let filter = PassengerFilter(rawValue: raw) else {
                    return nil
                }

                return PassengerFilterItem(
                    filter: filter,
                    count: Int(entity.count),
                    canIncrease: entity.canIncrease,
                    canDecrease: entity.canDecrease
                )
            }

            return unsorted.sorted {
                $0.filter.sortIndex < $1.filter.sortIndex
            }

        } catch {
            print("❌ Failed to fetch filters: \(error)")
            return PassengerFilterItem.getFilterList()
        }
    }
}

extension PassengerFilterStorage {
    static let shared = PassengerFilterStorage(
        container: {
            let container = NSPersistentContainer(name: "PassengerFiltersModel")
            container.loadPersistentStores { _, error in
                if let error = error {
                    fatalError("Core Data failed to load: \(error)")
                }
            }
            return container
        }()
    )
}
