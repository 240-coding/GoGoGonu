import SwiftUI

struct WoomulGonuView: View {
    @State var GonuPositionState = [1, 0, -1, 1, 0]
    let GonuMovablePosition = ([1, 2, 3], [0, 2, 4], [0, 1, 3, 4], [0, 2, 4], [1, 2, 3])
    let StoneCoordinate: [[CGFloat]] = [[0, -300], [-300, 0], [0, 0], [300, 0], [0, 300]]
    @State var count = 0
    @State var isMyTurn = true
    @State var isMoving = false
    @ObservedObject var woomulData = WoomulGonuData()
    
    var body: some View {
        var btns = [AnyView]()
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            Header(title: "WoomulGonu")
                WoomulShape()
                ForEach(0..<5) { index in
                    WoomulStone(position: index, woomulData: woomulData).offset(x: StoneCoordinate[index][0], y: StoneCoordinate[index][1])
//                WoomulStone(index: 1).offset(x: StoneCoordinate[1][0], y: StoneCoordinate[1][1])
            }
            Text(String(woomulData.test))
        }
        .navigationBarHidden(true)
    }
    
    func changeValue() {
        count += 1
    }
}
