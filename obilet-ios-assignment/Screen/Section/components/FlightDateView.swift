//

import SwiftUI

struct FlightDateView: View {
    
    let departureFlightDate: FlightDate
    
    let returnFlightDate: FlightDate?
    
    let sizeOfIcon : CGFloat = 20
    let spaceBetweenHStack : CGFloat = 8
    
    let onDepartureDateButtonClick: () -> Void
    
    let onAddOrRemoveReturnButtonClick: () -> Void
    
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
                    
                    VStack(spacing: 6) {
                        Text(LocalizedStrings.departureLabel)
                            .font(.custom(Nunito.bold, size: 18))
                            .foregroundColor(OBiletColors.primary)
                        
                        
                        HStack(spacing: 4) {
                            Text(departureFlightDate.day)
                                .font(.custom(Nunito.bold, size: 30))
                                .foregroundColor(OBiletColors.primaryText)
                            VStack {
                                Text("\(departureFlightDate.month)\n\(departureFlightDate.dayOfWeek)")
                                    .font(.custom(Nunito.medium, size: 12))
                                    .foregroundColor(OBiletColors.primaryText)
                            }
                        }
                        .onTapGesture {
                            onDepartureDateButtonClick()
                        }
                    
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
                
                
                Divider()
                    .frame(width: 1)
                    .frame(maxHeight: .infinity)
                    .background(Color.gray)
                    .padding(.horizontal)
                    .padding(.vertical, 6)
                
                
                HStack {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(LocalizedStrings.returnLabel)
                            .font(.custom(Nunito.bold, size: 18))
                            .foregroundColor(OBiletColors.primary)
                        
                        if(returnFlightDate == nil) {
                            Text(LocalizedStrings.addReturnLabel)
                                .font(.custom(Nunito.medium, size: 16))
                                .foregroundColor(OBiletColors.primaryText)
                        } else {
                            HStack(spacing: 4) {
                                Text(returnFlightDate!.day)
                                    .font(.custom(Nunito.bold, size: 30))
                                    .foregroundColor(OBiletColors.primaryText)
                                VStack {
                                    Text("\(returnFlightDate!.month)\n\(returnFlightDate!.dayOfWeek)")
                                        .font(.custom(Nunito.medium, size: 12))
                                        .foregroundColor(OBiletColors.primaryText)
                                }
                            }
                        }
                        
                        //this could be better
                        if(returnFlightDate == nil) {
                            Spacer()
                        }
                        
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    Image(systemName: "plus.circle")
                        .foregroundColor(OBiletColors.secondaryIcon)
                        .padding()
                        .rotationEffect(
                            returnFlightDate == nil ? Angle(degrees: 0) : Angle(degrees: 45)
                        )
                        .onTapGesture {
                            onAddOrRemoveReturnButtonClick()
                        }
                    
                }
                .padding(.vertical, 8)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
            }
            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
            .padding(.vertical, 8)
            
        }
        .fixedSize(horizontal: false, vertical: true)
        .padding(.horizontal)
        
    }
}

#Preview {
    VStack {
        FlightDateView(
            departureFlightDate: .init(
                day: "18",
                month: "Kasim",
                dayOfWeek: "Pazartesi"
            ),
            returnFlightDate: .init(
                day: "26",
                month: "Agustos",
                dayOfWeek: "Sali"
            ),
            onDepartureDateButtonClick: {
            }
        ) {
            
        }
        
        FlightDateView(
            departureFlightDate: .init(
                day: "18",
                month: "Kasim",
                dayOfWeek: "Pazartesi"
            ),
            returnFlightDate: nil,
            onDepartureDateButtonClick: {
            }
        ) {
            
        }
    }
}
