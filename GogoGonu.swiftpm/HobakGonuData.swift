import Foundation
import SwiftUI

class HobakGonuData: ObservableObject {
    @Published var GonuPositionState = [1, 1, 1, -1, -1, -1, -1, -1, 0, 0, 0]
    let initialGonuPositionState = [1, 1, 1, -1, -1, -1, -1, -1, 0, 0, 0]
}
