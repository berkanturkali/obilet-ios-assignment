//

import SwiftUI

struct FlightSection: View {
    
    @Binding var defaultOriginAndTargetDestinations: OriginAndTargetDestionation
    
    
    let locations: [BusLocationDTO]
    
    @ObservedObject var viewModel: FlightSectionViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                OBiletColors.background.ignoresSafeArea()

                flightSectionContent()
            }
        }
        .onAppear {
            if(viewModel.selectedOriginAndTargetDestination?.origin == nil) {
                viewModel.selectedOriginAndTargetDestination = defaultOriginAndTargetDestinations
            }
        }
        .onChange(of: defaultOriginAndTargetDestinations) { oldValue, newValue in
            print("new value is \(String(describing: newValue))")
            viewModel.selectedOriginAndTargetDestination = newValue
        }
    }
    
    @ViewBuilder
    private func flightSectionContent() -> some View {
        VStack(spacing: 16) {
            
            LocationsCardView(
                origin: Binding(
                    get: {
                        viewModel.selectedOriginAndTargetDestination?.origin?.cityName ?? ""
                    }, set: { newValue in
                        if(viewModel.selectedOriginAndTargetDestination != nil) {
                            viewModel.selectedOriginAndTargetDestination!.origin?.cityName = newValue
                        }
                    }
                ),
                destination: Binding(
                    get: {
                        viewModel.selectedOriginAndTargetDestination?.target?.cityName ?? ""
                    }, set: { newValue in
                        if(viewModel.selectedOriginAndTargetDestination != nil) {
                            viewModel.selectedOriginAndTargetDestination!.target?.cityName = newValue
                        }
                    }
                ),
                locations: locations,
                onSwipeButtonClick: { origin, target in
                }
            ){
                selectedLocation,
                direction in
                viewModel.selectedOriginAndTargetDestination = OriginAndTargetDestionation(
                    origin: direction == .origin && viewModel.selectedOriginAndTargetDestination?.target?.name != selectedLocation.name ? selectedLocation : viewModel.selectedOriginAndTargetDestination?.origin,
                    target: direction == .target && viewModel.selectedOriginAndTargetDestination?.origin?.name != selectedLocation.name ? selectedLocation : viewModel.selectedOriginAndTargetDestination?.target
                )
            }
            
            FlightDateView(onAddReturnButtonClick: {})
            
            PassengerSection(selectedFilters: $viewModel.summaryText)
            
            Button(action: {
                // find the ticket
            }) {
                Text(LocalizedStrings.findTheTicket)
                    .foregroundColor(.white)
                    .font(.custom(Nunito.bold, size: 16))
                    .padding(.horizontal, 72)
                    .padding(.vertical, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(OBiletColors.button)
                    )
            }
            .padding(.top, 24)
            
            Text(LocalizedStrings.loremDummy)
                .foregroundColor(OBiletColors.primaryTextWithHalfOpacity)
                .font(.custom(Nunito.medium, size: 16))
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .padding()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    FlightSection(
        defaultOriginAndTargetDestinations: .constant(OriginAndTargetDestionation()),
        locations: [],
        viewModel: FlightSectionViewModel()
    )
}
