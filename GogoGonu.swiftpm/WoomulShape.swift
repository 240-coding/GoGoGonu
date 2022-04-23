import SwiftUI

struct WoomulShape: View {
    var body: some View {
        GeometryReader { geometry in
            Path() { path in
                let width = geometry.size.width
                let height = geometry.size.height
                path.addArc(center: CGPoint(x: width / 2, y: height * 0.6), radius: 300, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: true)
                path.move(to: CGPoint(x: width / 2 - 300, y: height * 0.6))
                path.addLine(to: CGPoint(x: width / 2 + 300, y: height * 0.6))
                path.move(to: CGPoint(x: width / 2, y: height * 0.6 - 300))
                path.addLine(to: CGPoint(x: width / 2, y: height * 0.6 + 300))
            }.stroke(Color("RedColor"), style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
        }
        
    }
}
