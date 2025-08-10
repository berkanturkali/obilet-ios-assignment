//

import SwiftUI

struct LocationsCardView: View {
    
    @Binding var origin: String
    
    @Binding var destination: String
    
    @State private var originOffset: CGFloat = 0
    
    @State private var destinationOffset: CGFloat = 0
    
    @State private var locationsOpacity: Double = 1
    var body: some View {
        ZStack {
            VStack(spacing: 4) {
                LocationView(
                    title: LocalizedStrings.originLabel,
                    icon: "mappin.circle",
                    selectedLocation: origin,
                    textOffset: originOffset,
                    textOpacity: locationsOpacity
                )
                
                LocationView(
                    title: LocalizedStrings.targetDestinationLabel,
                    icon: "mappin.circle.fill",
                    selectedLocation: destination,
                    textOffset: destinationOffset,
                    textOpacity: locationsOpacity
                )
            }
            
            HStack {
                Spacer()
                SwapDirectionButton() {
                    
                    withAnimation(.easeIn(duration: 0.14)) {
                        originOffset = -24
                        destinationOffset = 24
                        locationsOpacity = 0
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.14) {
                        swap(&origin, &destination)
                        
                        originOffset = 36
                        destinationOffset = -36
                        locationsOpacity = 0
                        
                        withAnimation(.interpolatingSpring(mass: 0.22, stiffness: 120, damping: 12, initialVelocity: 0.8)) {
                            originOffset = 0
                            destinationOffset = 0
                            locationsOpacity = 1
                        }
                    }
                }                    }
            
        }
    }
}

#Preview {
    LocationsCardView(
        origin: .constant("Istanbul Avrupa"), destination: .constant("Izmir")
    )
}
