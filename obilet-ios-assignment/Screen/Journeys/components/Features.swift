//

import SwiftUI
import Kingfisher

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
                if let url = URL(string: feature.imageURL), feature.id != nil, !failed {
                    KFImage(url)
                        .placeholder { ProgressView() }
                        .onFailure({ _ in
                            failed = true
                        })
                        .resizable()
                        .scaledToFill()
                        .frame(width: 16, height: 16)
                        .clipped()
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
