//

import SwiftUI

struct JourneyItem: View {
    
    @State var busStopsExpanded = false
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
                
                if !busStopsExpanded {
                    Divider()
                }
                
                //Stop List
                ExpandableStopList(visible: busStopsExpanded, stops: [])
                
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
                            .rotationEffect(.degrees(busStopsExpanded ? 180 : 0))
                        
                        Text("Review")
                            .font(.custom(Nunito.extraBold, size: 10))
                            .foregroundColor(OBiletColors.primaryText)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.horizontal)
                    .onTapGesture {
                        withAnimation {
                            busStopsExpanded.toggle()
                        }
             
                    }
                }
                .padding(.vertical)
                
            }
            
        }
        .fixedSize(horizontal: false, vertical: true)
        .padding()
    }
}

struct ExpandableStopList: View {
    let visible: Bool
    let stops: [Stop]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
                 if visible {
                     JourneyStopView(stopList: stops)
                         .transition(.asymmetric(
                             insertion: .move(edge: .top).combined(with: .opacity),
                             removal:  .move(edge: .top).combined(with: .opacity)
                         ))
                 }
             }
             .animation(.easeInOut(duration: 0.10), value: visible)
    }
}

#Preview {
    JourneyItem()
}
