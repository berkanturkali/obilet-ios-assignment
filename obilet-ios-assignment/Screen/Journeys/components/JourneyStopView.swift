//

import SwiftUI

struct JourneyStopView: View {
    
    let stopList: [StopDTO]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(Array(stopList.enumerated()), id: \.element.id) { index, stop in
                    let firstItem = index == 0
                    let lastItem  = index == stopList.count - 1

                    JourneyStopItem(
                        stop: stop,
                        firstItem: firstItem,
                        lastItem: lastItem
                    )
                }
            }
        }
        .frame(height: 100)                // .height(100.dp)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    JourneyStopView(
        stopList: [           
        ]
    )
}
