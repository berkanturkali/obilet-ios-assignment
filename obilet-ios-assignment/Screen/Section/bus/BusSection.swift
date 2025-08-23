//

import SwiftUI

struct BusSection: View {
    
    @Binding var defaultOriginAndTargetDestinations: OriginAndTargetDestionation
    
    var locations: [BusLocationDTO] = []
    
    @ObservedObject var viewModel: BusSectionViewModel
    
    @State private var navArgs: BusJourneysArgs? = nil
    
    let DEPARTURE_DATE_PATTERN = "yyyy-MM-dd"
    
    var body: some View {
        NavigationStack {
            ZStack {
                OBiletColors.background
                    .ignoresSafeArea()
                
                busSectionContent(locations: locations) {
                    let origin = viewModel.selectedOriginAndTargetDestination?.origin
                    let destination = viewModel.selectedOriginAndTargetDestination?.target
                    let originId = origin?.id
                    let destinationId = destination?.id
                    
                    let departureDate = FormatDateWithTheGivenPatternUseCase.callAsFunction(date: viewModel.selectedDate, pattern: DEPARTURE_DATE_PATTERN)
                    
                    if let origin, let destination, let originId, let destinationId  {
                        navArgs = BusJourneysArgs(
                            originId: originId,
                            destinationId: destinationId,
                            departureDate: departureDate,
                            originName: origin.name!,
                            destinationName: destination.name!
                        )
                    }
                }
                
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
        .navigationDestination(item: $navArgs) { args in
            BusJourneysScreen(args: args)
        }
    }
    
    
    private func busSectionContent(
        locations: [BusLocationDTO],
        onFindButtonClick: @escaping () -> Void
    ) -> some View {
        
        VStack {
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
                    viewModel.swipeOriginAndTargetDestination()
                }) {
                    selectedLocation,
                    direction in
                    viewModel.selectedOriginAndTargetDestination = OriginAndTargetDestionation(
                        origin: direction == .origin && viewModel.selectedOriginAndTargetDestination?.target?.name != selectedLocation.name ? selectedLocation : viewModel.selectedOriginAndTargetDestination?.origin,
                        target: direction == .target && viewModel.selectedOriginAndTargetDestination?.origin?.name != selectedLocation.name ? selectedLocation : viewModel.selectedOriginAndTargetDestination?.target
                    )
                }
            
            DateView(
                selectedDay: $viewModel.selectedDay,
                selectedDate: $viewModel.selectedDate,
                displayDate: $viewModel.displayDate
            )
            
            Button(action: onFindButtonClick) {
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
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment:.top)
    }
}

#Preview {
    BusSection(
        defaultOriginAndTargetDestinations: .constant(
            OriginAndTargetDestionation()
        ),
        viewModel: BusSectionViewModel()
    )
}
