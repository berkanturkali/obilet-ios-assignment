//

import SwiftUI
import SDWebImageSwiftUI

struct Features: View {
    
    let features: [FeatureDTO]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(features) { feature in
                    FeatureItem(feature: feature)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.vertical, 4)
        }
        .scrollIndicators(.hidden)
    }
}

struct FeatureItem: View {
    
    var feature: FeatureDTO
    
    @State var failed: Bool = false
    var body: some View {
        
        ZStack {
            RoundedRectangle(
                cornerRadius: 16
            )
            .stroke(
                OBiletColors.button,
                lineWidth: 1
            )
            .fill(
                Color.white.opacity(
                    0
                )
            )
            
            HStack(spacing: 16) {
                if let url = URL(string: feature.imageURL), !failed {
                    WebImage(url: url)
                        .onFailure { error in
                            failed = true
                            print("SVG load failed:", error.localizedDescription)
                        }
                        .resizable()
                        .indicator(.activity)
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                        .foregroundColor(.secondary)
                }
                
                Text(feature.name ?? "")
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
    Features(
        features: FeatureDTO.mockList
    )
}
