//

import SwiftUI
import SDWebImageSVGCoder
import SDWebImage

@main
struct obilet_ios_assignmentApp: App {
    
    init() {
        let svg = SDImageSVGCoder.shared
        SDImageCodersManager.shared
            .addCoder(
                svg
            )
        let cache = SDImageCache.shared.config
          cache.shouldCacheImagesInMemory = true
          cache.maxMemoryCost = 50 * 1024 * 1024
     }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
