//

import SwiftUI

struct SearchScreenShimmer: View {
    var body: some View {
        ZStack {
            OBiletColors.background.ignoresSafeArea()
            VStack(spacing: 16) {
                RoundedRectangle(cornerRadius: 60)
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 50)
                    .shimmer()
                
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
            .padding()
            
        }
        
    }
}

#Preview {
    SearchScreenShimmer()
}
