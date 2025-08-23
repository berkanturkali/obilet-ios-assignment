//

import SwiftUI

struct LocationView: View {
    
    let title: String
    let icon: String
    let selectedLocation: String
    var textOffset: CGFloat = 0
    var textOpacity: Double = 1
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(OBiletColors.cardBackground)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(OBiletColors.cardStroke, lineWidth: 1)
                )
            
            HStack(spacing: 16) {
                Image(systemName: icon)
                    .foregroundColor(OBiletColors.iconPrimary)
                    .font(.system(size: 20))
                    .frame(maxHeight: .infinity, alignment: .bottomLeading)
                
                VStack(spacing: 0) {
                    Text(title)
                        .font(.custom(Nunito.bold, size: 16))
                        .foregroundColor(OBiletColors.primary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    Text(selectedLocation)
                        .font(.custom(Nunito.medium, size: 14))
                        .foregroundColor(OBiletColors.primaryText)
                        .frame(maxWidth: .infinity, alignment: .leading)                    
                        .offset(x: textOffset)
                        .opacity(textOpacity)
                }
                
                
            }
            .frame(maxHeight: .infinity, alignment: .bottomLeading)
            .padding(.horizontal)
            .padding(.vertical)
            
        }
        .frame(height: 90)
        .padding(.horizontal)
    }
}

#Preview {
    LocationView(
        title: "Nereden",
        icon: "mappin.circle",
        selectedLocation: "Istanbul"
    )
}
