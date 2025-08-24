//

import Foundation

struct LocalizedStrings {
    static var busTabLabel: String {
        return localizedString(for: "bus_tab_label")
    }
    
    static var planeTabLabel: String {
        return localizedString(for: "plane_tab_label")
    }
    
    static var originLabel: String {
        return localizedString(for: "origin_label")
    }
    
    static var targetDestinationLabel: String {
        return localizedString(for: "target_destination_label")
    }
    
    static var dateLabel: String {
        return localizedString(for: "date_label")
    }
    
    static var today: String {
        return localizedString(for: "today")
    }
    
    static var tomorrow: String {
        return localizedString(for: "tomorrow")
    }
    
    static var findTheTicket: String {
        return localizedString(for: "find_ticket")
    }
    
    static var loremDummy: String {
        return localizedString(for: "lorem_dummy")
    }
    
    static var departureLabel: String {
        return localizedString(for: "departure_label")
    }
    
    static var returnLabel: String {
        return localizedString(for: "return_label")
    }
    
    static var addReturnLabel: String {
        return localizedString(for: "add_return_label")
    }
    
    static var search: String {
        return localizedString(for: "search")
    }
    
    static var seeOnMap: String {
        return localizedString(for: "see_on_map")
    }
    
    static var somethingWentWrong: String {
        return localizedString(for: "something_went_wrong")
    }
    
    static var noResultFound: String {
        return localizedString(for: "no_result_found")
    }
    
    static var timeout: String {
        return localizedString(for: "timeout")
    }
    
    static var checkYourConnection: String {
        return localizedString(for: "check_your_connection")
    }
    
    static var canNotConnectToHost: String {
        return localizedString(for: "can_not_connected_to_host")
    }
    
    static var selectDate: String {
        return localizedString(for: "select_date")
    }
    
    static var done: String {
        return localizedString(for: "done")
    }
    
    static var passenger: String {
        return localizedString(for: "passenger")
    }
    
    static var adult : String {
        return localizedString(for: "adult")
    }
    
    static var studentPassenger: String {
        return localizedString(for: "student_passenger")
    }
    
    static var childPassenger: String {
        return localizedString(for: "child_passenger")
    }
    
    static var babyPassenger: String {
        return localizedString(for: "baby_passenger")
    }
    
    static var elderlyPassenger: String {
        return localizedString(for: "elder_passenger")
    }
    
    static var addPassenger: String {
        return localizedString(for: "add_passenger")
    }
    
    static var buyTicket: String {
        return localizedString(for: "buy_ticket")
    }
    
    static var review: String {
        return localizedString(for: "review")
    }
    
    static var durationHoursOnly : String {
        return localizedString(for: "duration_hours_only")
    }
    
    static var durationHoursAndMinutes: String {
        return localizedString(for: "duration_hours_minutes")
    }
    
    static var other: String {
        return localizedString(for: "other")
    }
    
    static var selectDepartureDate: String {
        return localizedString(for: "select_departure_date")
    }
    
    static var selectReturnDate: String {
        return localizedString(for: "select_return_date")
    }
    
    static func localizedString(for key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
}
