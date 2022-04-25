import SwiftUI
import AVKit

class SoundSetting: ObservableObject {
    static let instance = SoundSetting()
    
    var player: AVAudioPlayer?

    enum SoundName: String {
        case bgm
        case bubble
        case applause
    }
    
    func playSound(sound: SoundName) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: "mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print(error)
        }
    }
    
    func stopBackgroundMusic() {
        player?.stop()
    }
}
