//

import SwiftUI

struct JourneyPrice: View {
    
    let price: String?
    
    var body: some View {
        Text(price ?? "")
            .font(.custom(Nunito.extraBold, size: 14))
            .foregroundColor(OBiletColors.primaryText)
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

#Preview {
    JourneyPrice(
        price: "850 T"
    )
}
