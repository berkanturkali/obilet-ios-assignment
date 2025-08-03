//

import SwiftUI

struct BusSection: View {
    var body: some View {
        
        @State var heightOfLocationViews: CGFloat = 0
        
        VStack {
            
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
            
            Spacer()
            
            
            
            
        }
        
        
    }
}

#Preview {
    BusSection()
    
}
