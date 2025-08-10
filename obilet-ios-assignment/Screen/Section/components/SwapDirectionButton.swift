//

import SwiftUI

struct SwapDirectionButton: View {
    
    @State private var currentRotation: CGFloat = 0
    
    let onButtonClick: () -> Void
    var body: some View {
        Button(action: {
            withAnimation(.spring(response: 0.35, dampingFraction: 0.85, blendDuration: 0)) {
                currentRotation += 180
                onButtonClick()
            }
        }) {
            Image(systemName: "arrow.up.arrow.down")
                .foregroundColor(OBiletColors.secondaryIcon)
                .font(.system(size: 12))
                .padding(8)
                .background(
                    Circle()
                        .fill(OBiletColors.switchButtonBackground)
                        .overlay(
                            Circle()
                                .stroke(OBiletColors.divider, lineWidth: 1)
                        )
                )
        }
        .rotationEffect(.degrees(currentRotation))
        .padding(.trailing, 32)
    }
}

#Preview {
    SwapDirectionButton() {}
}
