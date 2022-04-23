import SwiftUI

struct WoomulStone: View {
    @State var position = 0
    @ObservedObject var woomulData: WoomulGonuData

    var body: some View {
        let isMoving = woomulData.isMoving
        let changedPosition = woomulData.changedPosition
        Button(action: { changeValue() }) {
            Circle()
                .fill(woomulData.GonuPositionState[position] == 0 ? Color("RedColor") : Color("BlueColor"))
                .frame(width: isMoving && changedPosition == position ? 120 : 100, height: isMoving && changedPosition == position ? 120 : 100)
                .opacity(woomulData.GonuPositionState[position] < 0 ? 0 : 1)
        }.disabled(woomulData.isMoving || woomulData.GonuPositionState[position] == woomulData.currentTurn ? false : true)
    }
 
    func changeValue() {
        if !woomulData.isMoving {
            woomulData.isMoving = true
            woomulData.changedPosition = self.position
        } else {
            let changedPosition = woomulData.changedPosition
            let myPosition = self.position
            if changedPosition == myPosition || woomulData.GonuPositionState[myPosition] > -1 || !woomulData.GonuMovablePosition[changedPosition].contains(myPosition) {
                woomulData.isMoving = false
            } else {
                swapStones()
                woomulData.isMoving = false
                woomulData.currentTurn = woomulData.currentTurn == 0 ? 1 : 0
                checkGameEnds()
            }
        }
    }
    
    func swapStones() {
        let temp = woomulData.GonuPositionState[position]
        woomulData.GonuPositionState[position] = woomulData.GonuPositionState[woomulData.changedPosition]
        woomulData.GonuPositionState[woomulData.changedPosition] = temp
    }
    
    func checkGameEnds() {
        let myStonesPosition = (0..<5).filter { woomulData.GonuPositionState[$0] == woomulData.currentTurn }
        for pos in myStonesPosition {
            for movablePos in  woomulData.GonuMovablePosition[pos] {
                if woomulData.GonuPositionState[movablePos] < 0 {
                    return
                }
            }
        }
        print("\(woomulData.currentTurn) Lose :(")
        woomulData.isGameFinishied = true
    }
}
