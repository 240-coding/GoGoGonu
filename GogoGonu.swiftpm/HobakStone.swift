import SwiftUI

struct HobakStone: View {
    @State var position = 0
    @ObservedObject var hobakData: HobakGonuData
    @State var computerPosition = 0
    
    var body: some View {
        let isMoving = hobakData.isMoving
        let changedPosition = hobakData.changedPosition
        Button(action: { changeValue() }) {
            Circle()
                .fill(Color(hobakData.GonuPositionState[position] == 0 ? "RedColor" : "BlueColor"))
                .frame(width: isMoving && changedPosition == position ? 100 : 85, height: isMoving && changedPosition == position ? 100 : 85)
                .opacity(hobakData.GonuPositionState[position] < 0 ? 0 : 1)
        }.disabled(hobakData.isMoving || hobakData.GonuPositionState[position] == hobakData.currentTurn ? false : true)
    }
    
    func changeValue() {
        if !hobakData.isMoving {
            hobakData.isMoving = true
            hobakData.changedPosition = self.position
        } else {
            let changedPosition = hobakData.changedPosition
            let myPosition = self.position
            if changedPosition == myPosition || hobakData.GonuPositionState[myPosition] > -1 || !hobakData.GonuMovablePosition[changedPosition].contains(myPosition) {
                hobakData.isMoving = false
            } else {
                moveStone()
                if hobakData.isGameFinishied {
                    return
                }
                if hobakData.isSinglePlayer {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        moveComputerStone()
                    }
                }
            }
        }
    }
    
    func moveStone() {
        SoundSetting.instance.playSound(sound: .bubble)
        swapStones()
        hobakData.isMoving = false
        checkGameEnds()
        if !hobakData.isGameFinishied {
            hobakData.currentTurn = hobakData.currentTurn == 0 ? 1 : 0
            hobakData.movingCount += 1
        }
    }
    
    func swapStones() {
        let currentPosition = hobakData.isSinglePlayer && hobakData.currentTurn == 1 ? self.computerPosition : self.position
        let temp = hobakData.GonuPositionState[currentPosition]
        hobakData.GonuPositionState[currentPosition] = hobakData.GonuPositionState[hobakData.changedPosition]
        hobakData.GonuPositionState[hobakData.changedPosition] = temp
    }
    
    func checkGameEnds() {
        let currentTurn = hobakData.currentTurn == 0 ? 1 : 0
        if hobakData.movingCount <= 2 { return }
        let myStonesInCirclePosition = (3...7).filter { hobakData.GonuPositionState[$0] == currentTurn }
        for pos in myStonesInCirclePosition {
            for movablePos in  hobakData.GonuMovablePosition[pos] {
                if hobakData.GonuPositionState[movablePos] < 0 {
                    return
                }
            }
        }
        hobakData.isGameFinishied = true
        SoundSetting.instance.playSound(sound: .applause)
        setEndMessage()
    }
    
    func setEndMessage() {
        let winner = hobakData.currentTurn == 0 ? "Red" : "Blue"
        hobakData.message = "🎉🎊 \(winner) Wins! 🥳🎉"
    }
    
    func moveComputerStone() {
        let myStonesPosition = (0..<11).filter { hobakData.GonuPositionState[$0] == hobakData.currentTurn }
        var movablePositionArray = [[Int]]()
        for pos in myStonesPosition {
            for movablePos in  hobakData.GonuMovablePosition[pos] {
                if hobakData.GonuPositionState[movablePos] < 0 {
                    movablePositionArray.append([pos, movablePos])
                }
            }
        }
        let selectedPos = movablePositionArray.randomElement()!
        hobakData.changedPosition = selectedPos[0]
        self.computerPosition = selectedPos[1]
        moveStone()
    }
}
