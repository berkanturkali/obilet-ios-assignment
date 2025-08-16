//

import SwiftUI

struct FlightSection: View {
    
    @State var origin: String = "Istanbul Avrupa"
    
    @State private var destination: String = "Izmir"
    
    let locations: [BusLocationDTO]
    
    var body: some View {
        NavigationStack {
            ZStack {
                OBiletColors.background.ignoresSafeArea()
                VStack(spacing: 16) {
                    
                    LocationsCardView(
                        origin: $origin,
                        destination: $destination,
                        locations: locations,
                        onSwipeButtonClick: { origin, target in
                        }
                    ) { selectedLocation, direction in
                        
                    }
                    
                    FlightDateView(onAddReturnButtonClick: {})
                    
                    PassengerSection(onAddPassengerTextClick: {})
                    
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
    }
}

#Preview {
    FlightSection(
        locations: []
    )
}
