import SwiftUI

struct HobakStone: View {
    @State var position = 0
    @ObservedObject var hobakData: HobakGonuData
    
    var body: some View {
        Button(action: { }) {
            Circle()
                .fill(Color(hobakData.GonuPositionState[position] == 0 ? "RedColor" : "BlueColor"))
                .frame(width: 100, height: 100)
                .opacity(hobakData.GonuPositionState[position] < 0 ? 0 : 1)
        }
    }
}
