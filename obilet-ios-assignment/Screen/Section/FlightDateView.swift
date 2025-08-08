//

import SwiftUI

struct FlightDateView: View {
    
    let sizeOfIcon : CGFloat = 20
    let spaceBetweenHStack : CGFloat = 8
    
    let onAddReturnButtonClick: () -> Void
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(OBiletColors.cardBackground)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(OBiletColors.cardStroke, lineWidth: 1)
                )
            
            HStack {
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(OBiletColors.iconPrimary)
                        .font(.system(size: sizeOfIcon))
                        .padding()
                    
                    VStack(spacing: 4) {
                        Text(LocalizedStrings.departureLabel)
                            .font(.custom(Nunito.bold, size: 18))
                            .foregroundColor(OBiletColors.primary)
                        
                        Spacer()
                        
                        
                        HStack(spacing: 4) {
                            Text("18")
                                .font(.custom(Nunito.bold, size: 28))
                                .foregroundColor(OBiletColors.primaryText)
                            VStack {
                                Text("Kasim\nPazartesi")
                                    .font(.custom(Nunito.medium, size: 12))
                                    .foregroundColor(OBiletColors.primaryText)
                            }
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 12)
                }
                
                
                Divider()
                    .frame(width: 1)
                    .frame(maxHeight: .infinity)
                    .background(Color.gray)
                    .padding()
                
                
                    HStack {
                        
                        VStack( alignment: .leading, spacing: 4) {
                            Text(LocalizedStrings.returnLabel)
                                .font(.custom(Nunito.bold, size: 18))
                                .foregroundColor(OBiletColors.primary)
                            
                            Spacer()
                            
                            Text(LocalizedStrings.addReturnLabel)
                                .font(.custom(Nunito.medium, size: 16))
                                .foregroundColor(OBiletColors.primaryText)
                            
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        Image(systemName: "plus.circle")
                            .foregroundColor(OBiletColors.secondaryIcon)
                            .padding()
                            .onTapGesture {
                                onAddReturnButtonClick()
                            }
                        
                    }
                    .padding(.vertical, 8)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                
            }
            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
            
        }
        .frame(height: 100)
        .padding(.horizontal)
    }
}

#Preview {
    FlightDateView() {
        
    }
}
