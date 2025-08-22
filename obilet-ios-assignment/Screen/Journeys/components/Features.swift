//

import SwiftUI

struct Features: View {
    var body: some View {
        HStack {
            featureItem
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
    
    var featureItem: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .stroke(OBiletColors.button, lineWidth: 1)
                .fill(Color.white.opacity(0))
            
            HStack(spacing: 16) {
                Image(systemName: "photo")
                    .fixedSize()
                    .frame(width: 4, height: 4)
                
                Text("Yeni Otoban")
                    .font(.custom(Nunito.medium, size: 10))
                    .foregroundColor(OBiletColors.primaryText)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 4)
        }
        .fixedSize(horizontal: true, vertical: true)
    }
}


#Preview {
    Features()
}
