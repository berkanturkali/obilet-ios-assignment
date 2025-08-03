//

import SwiftUI

struct SearchScreen: View {
    
    @State private var selectedTab: TransportTab = .bus
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                GeometryReader { geometry in
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .fill(Color.red)
                            .frame(height: 150)
                        
                        TransportTabBar(
                            selectedTab: $selectedTab
                        )
                        .animation(.easeInOut(duration: 0.4), value: selectedTab)
                
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(OBiletColors.divider, lineWidth: 1)
                            
                        )
                        .position(x: geometry.size.width / 2, y: 150)
                        
                    }
                }
                .frame(height: 150)
                
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SearchScreen()
}
