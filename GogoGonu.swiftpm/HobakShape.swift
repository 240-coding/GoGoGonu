import SwiftUI

struct HobakShape: View {
    var body: some View {
        GeometryReader { geometry in
            Path() { path in
                let width = geometry.size.width
                let height = geometry.size.height
                let radius = width * 0.3
                let lineSpace: CGFloat = 120
                path.move(to: CGPoint(x: width * 0.1, y: height / 2 - radius - lineSpace))
                path.addLine(to: CGPoint(x: width * 0.9, y: height / 2 - radius - lineSpace))
                path.move(to: CGPoint(x: width / 2, y: height / 2 - radius - lineSpace))
                path.addLine(to: CGPoint(x: width / 2, y: height / 2 + radius + lineSpace))
                path.addEllipse(in: CGRect(origin: CGPoint(x: width / 2 - radius, y: height / 2 - radius), size: CGSize(width: radius * 2, height: radius * 2)))
                path.move(to: CGPoint(x: width / 2 - radius, y: height / 2))
                path.addLine(to: CGPoint(x: width / 2 + radius, y: height / 2))
                path.move(to: CGPoint(x: width * 0.1, y: height / 2 + radius + lineSpace))
                path.addLine(to: CGPoint(x: width * 0.9, y: height / 2 + radius + lineSpace))
            }.stroke(Color("RedColor"), lineWidth: 5)
        }
        
    }
}
