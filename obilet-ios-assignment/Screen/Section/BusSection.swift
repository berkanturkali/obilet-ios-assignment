//

import SwiftUI

struct BusSection: View {
    
    @State var origin: String = "Istanbul Avrupa"
    
    @State private var destination: String = "Izmir"
    
    var body: some View {
        
        ZStack {
            OBiletColors.background
                .ignoresSafeArea()
            VStack {
                
                LocationsCardView(
                    origin: $origin,
                    destination: $destination
                )
                
                DateView()
                
                
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
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment:.top)
        }
        
        
        
    }
}

#Preview {
    BusSection()
    
}
