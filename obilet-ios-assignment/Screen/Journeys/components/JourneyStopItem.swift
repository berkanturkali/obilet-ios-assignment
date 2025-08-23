//

import SwiftUI

struct JourneyStopItem: View {
    
    let stop: StopDTO
    let firstItem: Bool
    let lastItem: Bool
    let lineColor: Color = Color(red: 0.9, green: 0.1, blue: 0.1)
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            
            ZStack {
                GeometryReader { geo in
                    let x = geo.size.width / 2
                    let midY = geo.size.height / 2
                    let radius: CGFloat = 11
                    
                    Path { p in
                        if !firstItem {
                            p.move(to: CGPoint(x: x, y: 0))
                            p.addLine(to: CGPoint(x: x, y: midY - radius))
                        }
                        
                        if !lastItem {
                            p.move(to: CGPoint(x: x, y: midY + radius))
                            p.addLine(to: CGPoint(x: x, y: geo.size.height))
                        }
                    }
                    .stroke(lineColor, style: StrokeStyle(lineWidth: 2, lineCap: .round))
                }
                
                Text(stop.mapResponseDateTimeToTimeFormat(responseDateTime: stop.time) ?? "")
                    .padding(10)
                    .font(.custom(Nunito.semiBold, size: 6))
                    .foregroundColor(.white)
                    .background(
                        Circle().fill(lineColor)
                    )
                    .fixedSize()
            }
            .frame(width: 22)
            
            
            VStack(alignment: .leading, spacing: 12) {
                Text(stop.name!)
                    .font(.custom(Nunito.semiBold, size: 12))
                    .foregroundColor(.primary)
                
            }
            .padding(.vertical, 10)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        
    }
}

#Preview {
    VStack(spacing: 0) {
        JourneyStopItem(
            stop: .init(
                id: 1,
                name: "Istanbul, Main Station",
                time: "11:02",
                isOrigin: true,
                isDestination: false,
                isSegmentStop: false
            ),
            firstItem: true,
            lastItem: false
        )
        JourneyStopItem(
            stop: .init(
                id: 1,
                name: "Istanbul, Main Station",
                time: "11:02",
                isOrigin: true,
                isDestination: false
    
            ),
            firstItem: false,
            lastItem: false
        )
        
        JourneyStopItem(
            stop: .init(
                id: 1,
                name: "Istanbul, Main Station",
                time: "11:02",
                isOrigin: true,
                isDestination: false
    
            ),
            firstItem: false,
            lastItem: true
        )
    }
}
