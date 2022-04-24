import Foundation
import SwiftUI

class HobakGonuData: ObservableObject {
    @Published var GonuPositionState = [1, 1, 1, -1, -1, -1, -1, -1, 0, 0, 0]
    let initialGonuPositionState = [1, 1, 1, -1, -1, -1, -1, -1, 0, 0, 0]
    let GonuMovablePosition = [[1], [0, 2, 3], [1], [4, 5, 6], [3, 5, 7], [3, 4, 6, 7], [3, 5, 7], [4, 5, 6], [9], [7, 8, 10], [9]]
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
