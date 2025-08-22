//

import SwiftUI

struct JourneyPrice: View {
    var body: some View {
        Text("850.0 T")
            .font(.custom(Nunito.extraBold, size: 14))
            .foregroundColor(OBiletColors.primaryText)
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

#Preview {
    JourneyPrice()
}
