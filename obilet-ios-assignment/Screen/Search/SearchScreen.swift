//

import SwiftUI

struct SearchScreen: View {
    
    @State private var selectedTab: TransportTab = .bus
    @State private var pushFromRight: Bool = false
    var body: some View {
        NavigationStack {
            ZStack {
                OBiletColors.background.ignoresSafeArea()
                VStack(spacing: 0) {
                    header
                    
                    Spacer()
                    
                    ZStack {
                        sectionView(for: selectedTab)
                    }
                    .padding(.top, 40)
                    .id(selectedTab)
                    .transition(
                        .asymmetric(
                            insertion: pushFromRight
                            ? .move(edge: .leading).combined(with: .opacity)
                            : .move(edge: .trailing).combined(with: .opacity),
                            removal: pushFromRight
                            ? .move(edge: .trailing).combined(with: .opacity)
                            : .move(edge: .leading).combined(with: .opacity)
                            
                        )
                    )
                    .animation(.easeInOut(duration: 0.20), value: selectedTab)
                }
            }
            .ignoresSafeArea()
            .onChange(of: selectedTab) { oldValue, newValue in
                pushFromRight = (newValue == .plane)
            }
        }
    }
    
    private var header: some View {
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
    }
    
    @ViewBuilder
    private func sectionView(for tab: TransportTab) -> some View {
        switch selectedTab {
        case .bus:
            BusSection()
        case .plane:
            FlightSection()
        }
    }
}

#Preview {
    SearchScreen()
}
