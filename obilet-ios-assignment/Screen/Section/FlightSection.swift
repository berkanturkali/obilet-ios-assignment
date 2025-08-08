//

import SwiftUI

struct FlightSection: View {
    var body: some View {
        ZStack {
            OBiletColors.background.ignoresSafeArea()
            VStack(spacing: 16) {
                ZStack {
                    VStack(spacing: 4) {
                        LocationView(
                            title: LocalizedStrings.originLabel,
                            icon: "mappin.circle",
                            selectedLocation: "İstanbul Avrupa"
                        )
                        
                        LocationView(
                            title: LocalizedStrings.targetDestinationLabel,
                            icon: "mappin.circle.fill",
                            selectedLocation: "Izmir"
                        )
                    }
                    
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            // swap action here
                        }) {
                            Image(systemName: "arrow.up.arrow.down")
                                .foregroundColor(OBiletColors.secondaryIcon)
                                .font(.system(size: 12))
                                .padding(8)
                                .background(
                                    Circle()
                                        .fill(OBiletColors.switchButtonBackground)
                                        .overlay(
                                            Circle()
                                                .stroke(OBiletColors.divider, lineWidth: 1)
                                        )
                                )
                        }
                        .padding(.trailing, 32)
                    }
                    
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

#Preview {
    FlightSection()
}
