//

import SwiftUI

struct SearchScreen: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                GeometryReader { geometry in
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .fill(Color.red)
                            .frame(height: 150)
                        
                        ZStack {
                            TabView {
                                
                            }
                            .tabViewStyle(.page(indexDisplayMode: .never))
                        }
                        .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .shadow(radius: 5)
                        .padding(.horizontal, 20)
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
