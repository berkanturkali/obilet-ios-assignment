//

import SwiftUI

struct Duration: View {
    var body: some View {
        HStack(spacing: 4) {
            
            Image(systemName: "clock.fill")
                .resizable()
                .frame(width: 12, height: 12)
                .foregroundColor(OBiletColors.iconPrimary)
            
            
            Text("7h")
                .font(.custom(Nunito.extraBold, size: 12))
                .foregroundColor(OBiletColors.primaryText)
            
            
        }
    }
}

#Preview {
    Duration()
}
