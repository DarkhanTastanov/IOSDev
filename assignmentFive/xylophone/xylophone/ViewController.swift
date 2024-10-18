import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func playSound(note: String) {
        guard let soundURL = Bundle.main.url(forResource: note, withExtension: "wav") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.play()
        } catch {
            print("Error playing sound")
        }
    }
    
    @IBAction func noteButtonPressed(_ sender: UIButton) {
        if let noteTitle = sender.currentTitle {
            playSound(note: noteTitle)
        }
    }
}
