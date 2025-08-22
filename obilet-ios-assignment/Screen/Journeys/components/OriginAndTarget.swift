//

import SwiftUI

struct OriginAndTarget: View {
    var body: some View {
        Text("Istanbul > Izmir")
            .font(.custom(Nunito.bold, size: 12))
            .foregroundColor(OBiletColors.primaryText)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.top, 1)
    }
}

#Preview {
    OriginAndTarget()
}
