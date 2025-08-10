//

import SwiftUI

struct TransportTabBar: View {
    
    @Binding var selectedTab: TransportTab
    
    var body: some View {
           HStack(spacing: 0) {
               ForEach(TransportTab.allCases, id: \.self) { tab in
                   VStack(spacing: 4) {
                       Image(systemName: tab.icon)
                           .rotationEffect(tab == .plane ? .degrees(-45) : .degrees(0))
                           .font(.system(size: 14))
                       Text(tab.title)
                           .font(.custom(Nunito.semiBold, size: 12))
                   }
                   .foregroundColor(selectedTab == tab ? OBiletColors.tabLayoutSelectedTextColor : OBiletColors.tabLayoutUnselectedTextColor)
                   .frame(maxWidth: .infinity, minHeight: 30)
                   .padding(.vertical, 2)
                   .background(
                       selectedTab == tab
                           ? OBiletColors.primary
                           : OBiletColors.background
                   )
                   .contentShape(Rectangle())
                   .onTapGesture {
                       selectedTab = tab
                   }
               }
           }
           .fixedSize(horizontal: false, vertical: true)
           .background(OBiletColors.background)
           .clipShape(RoundedRectangle(cornerRadius: 10))
       }
}

#Preview {
    TransportTabBar(
        selectedTab: .constant(.bus)
    )
}
