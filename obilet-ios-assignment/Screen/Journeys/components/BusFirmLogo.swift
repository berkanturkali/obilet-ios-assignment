//

import SwiftUI
import Kingfisher

struct BusFirmLogo: View {
    
    let url: String?
    
    @State private var loadFailed = false
    
    var body: some View {
        
        ZStack {
            if url == nil || loadFailed {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .padding(6)
                
            }
            
            if let url, let u = URL(string: url), !loadFailed {
                KFImage(u)
                    .placeholder {
                        ProgressView()
                    }
                    .onFailure { _ in
                        loadFailed = true
                    }
                    .resizable()
                    .scaledToFill()
                    .aspectRatio(contentMode: .fit)
                    .transition(.opacity)
            }
        }
        .frame(width: 60, height: 35)
        .clipped()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    BusFirmLogo(
        url: "https://s3.eu-central-1.amazonaws.com/static.obilet.com/images/partner/3557-sm.png"
    )
}
