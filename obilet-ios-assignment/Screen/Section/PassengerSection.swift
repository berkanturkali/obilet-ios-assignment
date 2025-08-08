//

import SwiftUI

struct PassengerSection: View {
    
    let onAddPassengerTextClick: () -> Void
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(OBiletColors.cardBackground)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(OBiletColors.cardStroke, lineWidth: 1)
                )
            
            HStack {
                HStack(spacing: 8) {
                    Image(systemName: "person.fill")
                        .foregroundColor(OBiletColors.iconPrimary)
                    
                    Text("1 Yetiskin")
                        .foregroundColor(OBiletColors.primaryText)
                        .font(.custom(Nunito.bold, size: 14))
                    
                }
                
                Spacer()
                
                
                Text("Yolcu Ekle")
                    .font(.custom(Nunito.regular, size: 14))
                    .foregroundColor(OBiletColors.primaryTextWithHalfOpacity)
                    .onTapGesture {
                        onAddPassengerTextClick()
                    }
                
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 12)
            .padding(.vertical)
        }
        .fixedSize(horizontal: false, vertical: true)
        .padding(.horizontal)

    }
}

#Preview {
    PassengerSection(){}
}
