//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
            OBiletColors.primary.ignoresSafeArea()
            
            Image("splash_logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
        }
    }
}

#Preview {
    SplashScreen()
}
