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
    
    @Binding var selectedDay: Day
    
    @Binding var selectedDate: Date
    
    @Binding var displayDate: String
    
    @State private var isDatePickerPresented = false
    
    private var formattedLocalizedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM yyyy"
        formatter.locale = Locale.current
        return formatter.string(from: selectedDate)
    }
    
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
                    
                    
                    Text(displayDate)
                        .font(.custom(Nunito.medium, size: 14))
                        .foregroundColor(OBiletColors.primaryText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .onTapGesture {
                    isDatePickerPresented.toggle()
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
        .sheet(isPresented: $isDatePickerPresented) {
            ZStack {
                OBiletColors.background.ignoresSafeArea()
                VStack {
                    Text(LocalizedStrings.selectDate)
                        .font(.custom(Nunito.bold, size: 18))
                        .foregroundColor(OBiletColors.primary)
                        .padding(.top)
                    DatePicker(
                        LocalizedStrings.selectDate,
                        selection: $selectedDate,
                        in: Date()...,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.graphical)
                    .accentColor(OBiletColors.primary)
                    
                    Button(LocalizedStrings.done) {
                        displayDate = formattedLocalizedDate
                        isDatePickerPresented = false
                    }
                    .font(.custom(Nunito.bold, size: 16))
                    .foregroundColor(.white)
                    .padding(.horizontal, 72)
                    .padding(.vertical, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(OBiletColors.button)
                    )
                }
            }
        }
        .onAppear {
            displayDate = formattedLocalizedDate
        }
        
        
    }
    
    
}

#Preview {
    DateView(
        selectedDay: 
                .constant(
                    .other
                ),
        selectedDate: 
                .constant(
                    Date()
                ),
        displayDate: 
                .constant(
                    ""
                )
    )
}
