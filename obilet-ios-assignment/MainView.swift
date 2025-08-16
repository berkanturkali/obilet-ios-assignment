//

import SwiftUI

struct MainView: View {
    
    @StateObject
    private var viewModel = MainViewModel()
    
    var body: some View {
        ZStack {
            if viewModel.showSplashScreen {
                SplashScreen()
                    .transition(
                        .asymmetric(
                            insertion: .opacity
                                .combined(with: .scale(scale: 0.98)),
                            removal: .opacity
                        )
                    )
                    .zIndex(1)
            } else {
                SearchScreen()
                    .transition(.opacity)
                    .zIndex(0)
            }
            
        }
        .animation(.easeInOut(duration: 0.35), value: viewModel.showSplashScreen)
    }
}

#Preview {
    MainView()
}
