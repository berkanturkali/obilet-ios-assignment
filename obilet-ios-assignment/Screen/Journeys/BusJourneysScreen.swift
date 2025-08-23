//

import SwiftUI

struct BusJourneysScreen: View {
    
    @StateObject private var viewModel: BusJourneysScreenViewModel
    
    init(args: BusJourneysArgs) {
        _viewModel = StateObject(
            wrappedValue: BusJourneysScreenViewModel(
                args: args
            )
        )
    }
    
    var body: some View {
        ZStack {
            OBiletColors.background.ignoresSafeArea()
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.journeys) { journey in
                        JourneyItem(
                            journey: journey
                        )
                    }
                }
            }
        }
    }
}

#Preview {
    BusJourneysScreen(
        args: BusJourneysArgs(
            originId: 1,
            destinationId: 1,
            departureDate: "11:02",
            originName: "Izmir",
            destinationName: "Ankara"
        )
    )
}
