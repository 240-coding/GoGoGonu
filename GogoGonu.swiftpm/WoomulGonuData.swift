import Foundation
import SwiftUI

class WoomulGonuData: ObservableObject {
    @Published var test = ""
    @Published var GonuPositionState = [1, 0, -1, 1, 0]
    let GonuMovablePosition = [[1, 2, 3], [0, 2, 4], [0, 1, 3, 4], [0, 2], [1, 2]]
    let StoneCoordinate: [[CGFloat]] = [[0, -300], [-300, 0], [0, 0], [300, 0], [0, 300]]
    @Published var isMoving = false
    @Published var changedPosition = 0
    @Published var changingPosition = 0
    @Published var isGameFinishied = false
    @Published var movingCount = 0
    @Published var currentTurn = 0
    @Published var message = ""
}
