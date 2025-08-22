//

import SwiftUI

struct BusType: View {
    var body: some View {
        HStack {
            
            Image(systemName: "sofa.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
                .foregroundColor(OBiletColors.iconPrimary)
            
            Text("2+1")
                .font(.custom(Nunito.bold, size: 12))
                .foregroundColor(OBiletColors.primaryText)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    BusType()
}
