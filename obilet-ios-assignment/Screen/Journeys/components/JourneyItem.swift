//

import SwiftUI

struct JourneyItem: View {
    
    let journey: BusJourneyResponseModel
    
    @State var busStopsExpanded = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(OBiletColors.background)
            
            VStack {
                
                HStack {
                    
                    BusFirmLogo(
                        url: APIConfig.busFirmImageBaseURL.absoluteString + "\(String(describing: journey.partnerId))" + "-sm.png"
                    )
                    
                    JourneyTime(
                        time: journey.journey?.departure ?? ""
                    )
                    
                    JourneyPrice(
                        price: journey.journey?
                            .formatThePrice(
                                price: String(
                                    describing: journey.journey?.originalPrice
                                ),
                                currencyCode: journey.journey?.currency
                            )
                    )
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                
                HStack {
                    
                    BusType(
                        type: journey.busType
                    )
                    
                    Duration(
                        duration: journey.journey?
                            .formatDurationForDisplay(
                                journey.journey?.duration
                            )
                    )
                    
                    Spacer()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .padding(.horizontal)
                
                OriginAndTarget(
                    originAndTarget: "\(journey.journey?.origin ?? "") > \(journey.journey?.destination ?? "")"
                )
                
                Divider()
                
                //features
                if let features = journey.features, !features.isEmpty {
                    Features(features: features)
                }
                
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
                        
                        Text(LocalizedStrings.review)
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
    let stops: [StopDTO]
    
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

//#Preview {
//    JourneyItem(
//
//    )
//}
