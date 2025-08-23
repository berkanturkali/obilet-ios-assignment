//

import SwiftUI

struct JourneyTime: View {
    
    let time: String
    
    var body: some View {
        Text("10:21")
            .font(.custom(Nunito.bold, size: 12))
            .foregroundColor(OBiletColors.primaryText)
            .frame(maxWidth: .infinity, alignment: .center)
    }
}

#Preview {
    JourneyTime(
        time: "11:02"
    )
}
