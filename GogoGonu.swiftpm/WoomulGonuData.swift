import Foundation
import SwiftUI

class WoomulGonuData: ObservableObject {
    @Published var GonuPositionState = [1, 0, -1, 1, 0]
    let initialGonuPositionState = [1, 0, -1, 1, 0]
    let GonuMovablePosition = [[1, 2, 3], [0, 2, 4], [0, 1, 3, 4], [0, 2], [1, 2]]
    let StoneCoordinate: [[CGFloat]] = [[0, -300], [-300, 0], [0, 0], [300, 0], [0, 300]]
    @Published var isMoving = false
    @Published var changedPosition = 0
    @Published var isSinglePlayer = true
    @Published var movingCount = 0
    @Published var currentTurn = 0
    @Published var message = ""
    @Published var isGameFinishied = false
    
    func initGonu() {
        self.GonuPositionState = initialGonuPositionState
        self.isMoving = false
        self.changedPosition = 0
        self.movingCount = 0
        self.currentTurn = 0
        self.message = ""
        self.isGameFinishied = false
    }
}
