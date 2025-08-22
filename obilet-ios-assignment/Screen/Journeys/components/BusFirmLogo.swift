//

import SwiftUI

struct BusFirmLogo: View {
    var body: some View {
        Image(systemName: "photo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 60, height: 35)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    BusFirmLogo()
}
