//

import SwiftUI

struct OriginAndTarget: View {
    
    let originAndTarget: String?
    
    var body: some View {
        Text(originAndTarget ?? "")
            .font(.custom(Nunito.bold, size: 12))
            .foregroundColor(OBiletColors.primaryText)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.top, 1)
    }
}

#Preview {
    OriginAndTarget(
        originAndTarget: "Izmir > Izmir"
    )
}
