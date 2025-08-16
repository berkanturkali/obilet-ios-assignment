//

import SwiftUI

struct LocationItem: View {
    
    var locationName: String
    
    var latitude: Double?
    var longitude: Double?
    
    let onLocationItemClick: (String) -> Void
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 18)
                .foregroundColor(OBiletColors.cardBackground)
                .overlay(
                    RoundedRectangle(cornerRadius: 18)
                        .stroke(OBiletColors.cardStroke, lineWidth: 1)
                )
            
            
            HStack {
                
                HStack(spacing: 8) {
                    Image(
                        systemName: "mappin.circle"
                    )
                    .foregroundColor(OBiletColors.iconPrimary)
                    .font(.system(size: 24))
                    
                    Text(locationName)
                        .foregroundColor(OBiletColors.primary)
                        .font(.custom(Nunito.bold, size: 18))
                }
                
                Spacer()
                
                VStack(spacing: 4) {
                    Image(systemName: "chevron.right")
                        .foregroundColor(OBiletColors.primary)
                        .padding(6)
                        .background(
                            Circle().fill(OBiletColors.cardBackground)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 18)
                                        .stroke(OBiletColors.cardStroke, lineWidth: 1)
                                )
                        )
                        .font(.system(size: 12, weight: .semibold))
                    
                    Text(LocalizedStrings.seeOnMap)
                        .foregroundColor(OBiletColors.locationItemSeeOnMapText)
                        .font(.custom(Nunito.bold, size: 12))
                    
                }
                .onTapGesture {
                    //navigate to map with location
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 14)
        }
        .fixedSize(horizontal: false, vertical: true)
        .onTapGesture {
            onLocationItemClick(locationName)
        }
    }
}

#Preview {
    LocationItem(
        locationName: "Location",
        latitude: nil,
        longitude: nil
    ) { _ in }
}
