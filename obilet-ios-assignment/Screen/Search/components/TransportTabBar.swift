//

import SwiftUI

struct TransportTabBar: View {
    
    @State private var selectedTab: TransportTab = .bus
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(TransportTab.allCases, id: \.self) { tab in
                VStack(spacing: 4) {
                    Image(systemName: tab.icon)
                        .font(.system(size: 20))
                    
                    Text(tab.title)
                        .font(.custom(Nunito.semiBold, size: 14))
                }
   
                .foregroundColor(selectedTab == tab ? .white : .black)
                   .frame(maxWidth: .infinity)
                   .padding(.vertical, 10)
                   .background(selectedTab == tab ? Color.red : Color(.systemGray5))
                   .cornerRadius(10)
                   .onTapGesture {
                       selectedTab = tab
                   }
            }
        }
        .padding(6)
        .background(Color(.systemGray5))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding()
    }
}

#Preview {
    TransportTabBar()
}
