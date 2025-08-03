//

import SwiftUI

struct DateView: View {
    
    let spaceBetweenIconAndDate:CGFloat = 16
    
    let sizeOfIcon: CGFloat = 20
    
    let verticalSpace: CGFloat = 12
    
    let horizontalSpaceBetweenButtons: CGFloat = 16
    
    let backgroundCornerRadius: CGFloat = 12
    
    var startOffset: CGFloat {
        spaceBetweenIconAndDate + sizeOfIcon
    }   
    
    
    @State var selectedDay: Day = Day.other
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: backgroundCornerRadius)
                .foregroundColor(OBiletColors.cardBackground)
                .overlay(
                    RoundedRectangle(cornerRadius: backgroundCornerRadius)
                        .stroke(OBiletColors.cardStroke, lineWidth: 1)
                )
            
            VStack(spacing: verticalSpace) {
                Text(LocalizedStrings.dateLabel)
                    .font(.custom(Nunito.bold, size: 16))
                    .foregroundColor(OBiletColors.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .offset(x: startOffset)
                
                HStack(spacing: spaceBetweenIconAndDate) {
                    Image(systemName: "calendar.circle")
                        .foregroundColor(OBiletColors.iconPrimary)
                        .font(.system(size: 20))
                    
                    
                    Text("1 Nisan 2018 Pazar")
                        .font(.custom(Nunito.medium, size: 14))
                        .foregroundColor(OBiletColors.primaryText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .onTapGesture {
                    //show date picker
                }
                
                Divider()
                    .padding(.horizontal)
                
                HStack(spacing: horizontalSpaceBetweenButtons) {
                    
                    ForEach(Day.allCases.dropLast(), id: \.self) { day in
                        Button(action: {
                            if(day == selectedDay){
                                selectedDay = .other
                            } else {
                                selectedDay = day
                            }
                        }) {
                            Text(day.title)
                            
                        }
                        .foregroundColor(day == selectedDay ? .white : OBiletColors.button)
                        .font(.system(size: 12))
                        .padding(.vertical, 8)
                        .padding(.horizontal, 24)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(day == selectedDay ? OBiletColors.button :OBiletColors.switchButtonBackground)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(OBiletColors.button, lineWidth: 1)
                                )
                        )
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .offset(x: startOffset)
            }
            
            .padding(.horizontal)
        }
        
        .frame(height: 150)
        .padding(.horizontal)
        
        
    }
    
    
}

#Preview {
    DateView()
}
