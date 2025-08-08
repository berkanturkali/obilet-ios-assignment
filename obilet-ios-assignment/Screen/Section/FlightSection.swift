//

import SwiftUI

struct FlightSection: View {
    var body: some View {
        ZStack {
            OBiletColors.background.ignoresSafeArea()
            VStack(spacing: 8) {
                ZStack {
                    VStack(spacing: 8) {
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
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
   
    }
}

#Preview {
    FlightSection()
}
