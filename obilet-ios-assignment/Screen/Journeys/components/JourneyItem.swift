//

import SwiftUI

struct JourneyItem: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(OBiletColors.background)
            
            VStack {
                
                HStack {
                    
                    BusFirmLogo()
                    
                    JourneyTime()
                    
                    JourneyPrice()
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                
                HStack {
                    
                    BusType()
                    
                    Duration()
                    
                    Spacer()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .padding(.horizontal)
                
                OriginAndTarget()
                
                Divider()
                
                //features
                Features()
                
                Divider()
                
                ZStack {
                    
                    Button(action: {
                        //buy ticket
                    }) {
                        Text(LocalizedStrings.buyTicket)
                            .foregroundColor(.white)
                            .font(.custom(Nunito.bold, size: 10))
                            .padding(.horizontal, 24)
                            .padding(.vertical, 6)
                            .background(
                                RoundedRectangle(cornerRadius: 32)
                                    .fill(OBiletColors.button)
                            )
                    }
                    .fixedSize(horizontal: true, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    HStack {
                        Image(systemName: "chevron.down")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 12, height: 12)
                            .foregroundColor(OBiletColors.iconPrimary)
                        
                        Text("Review")
                            .font(.custom(Nunito.extraBold, size: 10))
                            .foregroundColor(OBiletColors.primaryText)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.horizontal)
                    
                }
                
            }
            
        }
        .fixedSize(horizontal: false, vertical: true)
        .padding()
    }
}

#Preview {
    JourneyItem()
}
