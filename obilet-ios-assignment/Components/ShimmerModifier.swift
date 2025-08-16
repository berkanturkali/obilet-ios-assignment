//

import SwiftUI

struct ShimmerModifier: ViewModifier {
    @State private var offset: CGFloat = -2

    func body(content: Content) -> some View {
        content
            .overlay(
                shimmer
                    .mask(content)
            )
            .onAppear {
                withAnimation(
                    Animation.linear(duration: 1.5)
                        .repeatForever(autoreverses: false)
                ) {
                    offset = 2
                }
            }
    }

    private var shimmer: some View {
        GeometryReader { geometry in
            LinearGradient(
                gradient: Gradient(colors: [
                    .clear,
                    Color.white.opacity(0.8),
                    .clear
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .frame(width: geometry.size.width)
            .offset(x: geometry.size.width * offset)
        }
    }
}

extension View {
    func shimmer() -> some View {
        self.modifier(ShimmerModifier())
    }
}
