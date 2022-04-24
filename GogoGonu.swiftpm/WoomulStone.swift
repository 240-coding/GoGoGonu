import SwiftUI

struct WoomulStone: View {
    @State var position = 0
    @ObservedObject var woomulData: WoomulGonuData
    @State var computerPosition = 0

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
            if checkIfFirstMove() {
                return
            }
            woomulData.isMoving = true
            woomulData.changedPosition = self.position
        } else {
            let changedPosition = woomulData.changedPosition
            let myPosition = self.position
            if changedPosition == myPosition || woomulData.GonuPositionState[myPosition] > -1 || !woomulData.GonuMovablePosition[changedPosition].contains(myPosition) {
                woomulData.isMoving = false
            } else {
                moveStone()
                if woomulData.isGameFinishied {
                    return
                }
                if woomulData.isSinglePlayer {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        moveComputerStone()
                            }
                }
            }
        }
    }
    
    func moveStone() {
        swapStones()
        woomulData.isMoving = false
        checkGameEnds()
        if !woomulData.isGameFinishied {
            woomulData.currentTurn = woomulData.currentTurn == 0 ? 1 : 0
            woomulData.movingCount += 1
        }
    }
    
    func checkIfFirstMove() -> Bool {
        if woomulData.movingCount == 0 && position == 4 {
            woomulData.isMoving = false
            woomulData.message = "You can't move this stone at first!"
            return true
        } else {
            woomulData.message = ""
            return false
        }
    }
    
    func swapStones() {
        let currentPosition = woomulData.isSinglePlayer && woomulData.currentTurn == 1 ? self.computerPosition : self.position
        let temp = woomulData.GonuPositionState[currentPosition]
        woomulData.GonuPositionState[currentPosition] = woomulData.GonuPositionState[woomulData.changedPosition]
        woomulData.GonuPositionState[woomulData.changedPosition] = temp
    }
    
    func checkGameEnds() {
        let currentTurn = woomulData.currentTurn == 0 ? 1 : 0
        woomulData.movingCount += 1
        let myStonesPosition = (0..<5).filter { woomulData.GonuPositionState[$0] == currentTurn }
        for pos in myStonesPosition {
            for movablePos in  woomulData.GonuMovablePosition[pos] {
                if woomulData.GonuPositionState[movablePos] < 0 {
                    return
                }
            }
        }
        woomulData.isGameFinishied = true
        setEndMessage()
    }
    
    func setEndMessage() {
        let winner = woomulData.currentTurn == 0 ? "Red" : "Blue"
        woomulData.message = "🎉🎊 \(winner) won! 🥳🎉"
    }
    
    func moveComputerStone() {
        let myStonesPosition = (0..<5).filter { woomulData.GonuPositionState[$0] == woomulData.currentTurn }
        var movablePositionArray = [[Int]]()
        for pos in myStonesPosition {
            for movablePos in  woomulData.GonuMovablePosition[pos] {
                if woomulData.GonuPositionState[movablePos] < 0 {
                    movablePositionArray.append([pos, movablePos])
                }
            }
        }
        let selectedPos = movablePositionArray.randomElement()!
        woomulData.changedPosition = selectedPos[0]
        self.computerPosition = selectedPos[1]
        moveStone()
    }
}
