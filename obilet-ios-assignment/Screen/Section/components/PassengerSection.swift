//

import SwiftUI

struct PassengerSection: View {
    
    @Binding var selectedFilters: String
    
    @State private var isPassengerSheetPresented = false
    
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
                    
                    Text(selectedFilters)
                        .foregroundColor(OBiletColors.primaryText)
                        .font(.custom(Nunito.bold, size: 14))
                    
                }
                .padding(.horizontal, 12)
                
                Spacer()
                
                
                Text(LocalizedStrings.addPassenger)
                    .font(.custom(Nunito.regular, size: 14))
                    .foregroundColor(OBiletColors.primaryTextWithHalfOpacity)
                    .padding(.horizontal, 12)
                    .padding(.vertical)
                    .onTapGesture {
                        isPassengerSheetPresented = true
                    }
                    .sheet(isPresented: $isPassengerSheetPresented) {
                        FlightSectionSelectPassenger()
                            .presentationDetents([.medium, .large])
                            .presentationDragIndicator(.visible)
                    }
                
                
                
            }
        }
        .fixedSize(horizontal: false, vertical: true)
        .padding(.horizontal)
        
    }
}

#Preview {
    PassengerSection(
        selectedFilters: .constant("1 Yetiskin")
    )
}
