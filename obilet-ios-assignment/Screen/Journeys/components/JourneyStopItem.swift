//

import SwiftUI

struct JourneyStopItem: View {
    
    let stop: Stop
    let firstItem: Bool
    let lastItem: Bool
    let lineColor: Color = Color(red: 0.9, green: 0.1, blue: 0.1)
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            
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
                
                Circle()
                    .fill(lineColor)
                    .frame(width: 36, height: 36)
                    .overlay(
                        Text(stop.time ?? "")
                            .padding(.horizontal, 4)
                            .font(.system(size: 10, weight: .semibold))
                            .foregroundColor(.white)
                            .minimumScaleFactor(0.5)
                   
                    )
            }
            .frame(width: 22)
            
            
            VStack(alignment: .leading, spacing: 4) {
                Text(stop.name!)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.primary)
                
            }
            .padding(.vertical, 10)
        }
        
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
                isTarget: false
    
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
                isTarget: false
    
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
                isTarget: false
    
            ),
            firstItem: false,
            lastItem: true
        )
    }
}
