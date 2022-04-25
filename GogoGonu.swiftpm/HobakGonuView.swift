import SwiftUI

struct HobakGonuView: View {
    @ObservedObject var hobakData = HobakGonuData()

    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .border(Color("YellowColor"), width: 15)
                .ignoresSafeArea()
            Header(title: "HobakGonu")
            HobakShape()
            GeometryReader { geometry in
                let width = geometry.size.width
                let height = geometry.size.height
                let radius = width * 0.3
                let lineSpace: CGFloat = 100
                
                ZStack {
                    let stonesOffset = [[-radius-lineSpace, -radius-lineSpace], [0, -radius-lineSpace], [radius+lineSpace, -radius-lineSpace], [0, -radius], [-radius, 0], [0, 0], [radius, 0], [0, radius], [-radius-lineSpace, radius+lineSpace], [0, radius+lineSpace], [radius+lineSpace, radius+lineSpace]]
                    ForEach(0..<11) { index in
                        HobakStone(position: index, hobakData: self.hobakData)
                            .offset(x: stonesOffset[index][0], y: stonesOffset[index][1])
                    }
                }
                    .position(x: width / 2, y: height / 2)
                VStack {
                    HStack(spacing: 30) {
                        Toggle(hobakData.isSinglePlayer ? "Single Mode" : "Multi Mode", isOn: $hobakData.isSinglePlayer)
                            .toggleStyle(.button)
                            .tint(Color("RedColor"))
                            .onChange(of: hobakData.isSinglePlayer) { value in
                                hobakData.initGonu()
                            }
                        Text("Count: \(hobakData.movingCount)")
                        HStack {
                            Text("Current Turn:")
                            Circle()
                                .fill(hobakData.currentTurn == 0 ?  Color("RedColor") : Color("BlueColor"))
                                .frame(width: 50)
                        }
                    }
                    Text(hobakData.message)
                        .fontWeight(hobakData.isGameFinishied ? .bold : .regular)
                }
                .font(.title)
                .position(x: geometry.size.width / 2, y: geometry.size.height * 0.93)
                .frame(height: 100)
            }
        }
        .onAppear{ SoundSetting.instance.stopBackgroundMusic() }
        .navigationBarHidden(true)
    }
}
