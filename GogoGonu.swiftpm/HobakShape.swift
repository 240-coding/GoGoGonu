import SwiftUI

struct HobakShape: View {
    var body: some View {
        GeometryReader { geometry in
            Path() { path in
                let width = geometry.size.width
                let height = geometry.size.height
                path.move(to: CGPoint(x: width * 0.1, y: height * 0.3))
                path.addLine(to: CGPoint(x: width * 0.9, y: height * 0.3))
                path.move(to: CGPoint(x: width * 0.5, y: height * 0.3))
                path.addLine(to: CGPoint(x: width * 0.5, y: height * 0.3 + width * 0.8))
                path.addEllipse(in: CGRect(origin: CGPoint(x: width * 0.5 - 225, y: height * 0.3 + width * 0.4 - 225), size: CGSize(width: 450, height: 450)))
                path.move(to: CGPoint(x: width * 0.5 - 225, y: height * 0.3 + width * 0.4))
                path.addLine(to: CGPoint(x: width * 0.5 + 225, y: height * 0.3 + width * 0.4))
                path.move(to: CGPoint(x: width * 0.1, y: height * 0.3 + width * 0.8))
                path.addLine(to: CGPoint(x: width * 0.9, y: height * 0.3 + width * 0.8))
            }.stroke(Color("RedColor"), lineWidth: 5)
        }
        
    }
}
