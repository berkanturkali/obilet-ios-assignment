//

import SwiftUI

struct FlightSection: View {
    
    @Binding var defaultOriginAndTargetDestinations: OriginAndTargetDestionation
    
    @State private var isDatePickerPresented = false
    
    let locations: [BusLocationDTO]
    
    @ObservedObject var viewModel: FlightSectionViewModel
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                OBiletColors.background.ignoresSafeArea()
                
                flightSectionContent()
                    .sheet(isPresented: $isDatePickerPresented) {
                        ZStack {
                            OBiletColors.background.ignoresSafeArea()
                            VStack {
                                Text(viewModel.flightDateType == .departure ? LocalizedStrings.selectDepartureDate : LocalizedStrings.selectReturnDate)
                                    .font(.custom(Nunito.bold, size: 18))
                                    .foregroundColor(OBiletColors.primary)
                                    .padding(.top)
                                
                                
                                let selectionIn = Calendar.current
                                    .date(
                                        byAdding: .day,
                                        value: viewModel.flightDateType == .returnDate ? 2 : 1,
                                        to: Date()
                                    )!...
                                
                                DatePicker(
                                    viewModel.flightDateType == .departure ? LocalizedStrings.selectDepartureDate : LocalizedStrings.selectReturnDate,
                                    selection: viewModel.flightDateType == .returnDate
                                    ? Binding<Date>(
                                        get: { viewModel.returnDate ?? Date() },
                                        set: {
                                            viewModel.returnDate = $0
                                        }
                                    )
                                    : $viewModel.departuraDate,
                                    in: selectionIn,
                                    displayedComponents: [.date]
                                )
                                .datePickerStyle(.graphical)
                                .accentColor(OBiletColors.primary)
                                
                                Text(LocalizedStrings.done)
                                    .font(.custom(Nunito.bold, size: 16))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 72)
                                    .padding(.vertical, 12)
                                    .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(OBiletColors.button)
                                    )
                                    .onTapGesture {
                                        
                                        if(
                                            viewModel.flightDateType == .returnDate && viewModel.returnDate == nil
                                        ){
                                            viewModel.returnDate = Calendar.current
                                                .date(
                                                    byAdding: .day,
                                                    value: 2,
                                                    to: Date()
                                                )!
                                            
                                        }
                                        isDatePickerPresented = false
                                        
                                    }
                            }
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
            
            FlightDateView(
                departureFlightDate: viewModel
                    .formatDepartureOrReturnDate(
                        date: viewModel.departuraDate
                    ),
                returnFlightDate: viewModel.returnDate == nil ? nil : viewModel
                    .formatDepartureOrReturnDate(
                        date: viewModel.returnDate!
                    ),
                onDepartureDateButtonClick: {
                    viewModel.flightDateType = .departure
                    isDatePickerPresented.toggle()
                }
            ){
                if(viewModel.returnDate != nil) {
                    viewModel.returnDate = nil
                } else {
                    viewModel.flightDateType = .returnDate
                    isDatePickerPresented.toggle()
                }
            }
            
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
