//

import SwiftUI

struct SearchScreenShimmer: View {
    var body: some View {
        ZStack {
            OBiletColors.background.ignoresSafeArea()
            VStack(spacing: 0) {
                GeometryReader { geometry in
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 130)
                            .shimmer()
                        
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 36)
                            .padding(.horizontal, 32)
                            .position(x: geometry.size.width / 2, y: 130)
                            .shimmer()
                    }
                }
                .frame(height: 130)
                .ignoresSafeArea()
                
                VStack(spacing: 16) {
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 120)
                        .shimmer()
                    
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 120)
                        .shimmer()
                    
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 180)
                        .shimmer()
                    
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.gray.opacity(0.3))
                        .padding(.horizontal, 42)
                        .frame(height: 50)
                        .padding(.vertical, 12)
                        .shimmer()
                    
                    
                    ForEach(
                        0..<2
                    ) { _ in
                        RoundedRectangle(
                            cornerRadius: 16
                        )
                        .fill(
                            Color.gray.opacity(
                                0.3
                            )
                        )
                        .frame(
                            height: 8
                        )
                        .padding(.horizontal, 12)
                        .shimmer()
                    }
                }
                
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.horizontal)
                .padding(.top)
            }
            
            
        }
        
    }
}

#Preview {
    SearchScreenShimmer()
}
