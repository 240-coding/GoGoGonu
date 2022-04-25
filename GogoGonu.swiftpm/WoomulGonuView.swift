import SwiftUI

struct WoomulGonuView: View {
    @State var GonuPositionState = [1, 0, -1, 1, 0]
    let GonuMovablePosition = ([1, 2, 3], [0, 2, 4], [0, 1, 3, 4], [0, 2, 4], [1, 2, 3])
    let StoneCoordinate: [[CGFloat]] = [[0, -300], [-300, 0], [0, 0], [300, 0], [0, 300]]
    @State var count = 0
    @State var isRedTurn = true
    @State var isMoving = false
    @ObservedObject var woomulData = WoomulGonuData()
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .border(Color("YellowColor"), width: 15)
                .ignoresSafeArea()
            Header(title: "WoomulGonu")
            WoomulShape()
            ForEach(0..<5) { index in
                WoomulStone(position: index, woomulData: woomulData).offset(x: StoneCoordinate[index][0], y: StoneCoordinate[index][1])
            }
            GeometryReader { geometry in
                VStack {
                    HStack(spacing: 30) {
                        Toggle(woomulData.isSinglePlayer ? "Single Mode" : "Multi Mode", isOn: $woomulData.isSinglePlayer)
                            .toggleStyle(.button)
                            .tint(Color("RedColor"))
                            .onChange(of: woomulData.isSinglePlayer) { value in
                                woomulData.initGonu()
                            }
                        Text("Count: \(woomulData.movingCount)")
                        HStack {
                            Text("Current Turn:")
                            Circle()
                                .fill(woomulData.currentTurn == 0 ?  Color("RedColor") : Color("BlueColor"))
                                .frame(width: 50)
                        }
                    }
                    Text(woomulData.message)
                        .fontWeight(woomulData.isGameFinishied ? .bold : .regular)
                }
                .font(.title)
                .position(x: geometry.size.width / 2, y: geometry.size.height * 0.9)
                .frame(height: 100)
            }
            
        }
        .navigationBarHidden(true)
        .onAppear{ SoundSetting.instance.stopBackgroundMusic() }
    }
    
    func changeValue() {
        count += 1
    }
}
