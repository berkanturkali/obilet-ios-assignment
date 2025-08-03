//

import SwiftUI

struct SearchScreen: View {
    
    @State private var selectedTab: TransportTab = .bus
    var body: some View {
        ZStack {
            OBiletColors.background.ignoresSafeArea()
            VStack(spacing: 0) {
                GeometryReader { geometry in
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .fill(Color.red)
                            .frame(height: 130)
                        
                        TransportTabBar(
                            selectedTab: $selectedTab
                        )
              
                        .animation(.easeInOut(duration: 0.4), value: selectedTab)
                
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(OBiletColors.divider, lineWidth: 1)
                            
                        )
                        .padding(.horizontal, 32)
                        .position(x: geometry.size.width / 2, y: 130)
                        
                    }
                }
                .frame(height: 130)
                
                Spacer()
                
                BusSection()
                    .padding(.top, 40)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SearchScreen()
}
