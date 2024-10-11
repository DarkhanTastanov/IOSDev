import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var softButton: UIButton!
    @IBOutlet weak var mediumButton: UIButton!
    @IBOutlet weak var hardButton: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var statusLabel: UILabel!
    
    var timer: Timer?
    var remainingTime: TimeInterval = 0
    var audioPlayer: AVAudioPlayer?
    
    let durations: [String: TimeInterval] = [
        "Soft": 4,
        "Medium": 5,
        "Hard": 10
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetUI()
    }
    
    func resetUI() {
        progressBar.progress = 0.0
        statusLabel.text = "How do you want to cook?"
    }
    
    func startTimer(for eggType: String) {
        guard let duration = durations[eggType] else { return }
        remainingTime = duration
        statusLabel.text = "Cooking \(eggType)..."
        progressBar.progress = 1.0
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        remainingTime -= 1
        progressBar.setProgress(Float(remainingTime / (remainingTime + 1)), animated: true)
        
        print("Remaining time: \(Int(remainingTime)) seconds")  // Print remaining time to console
        
        if remainingTime <= 0 {
            timer?.invalidate()
            statusLabel.text = "Done"
            playAlarm()
        }
    }
    
    func playAlarm() {
        if let soundURL = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") {
            audioPlayer = try? AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.play()
        }
    }
    
    @IBAction func eggButtonPressed(_ sender: UIButton) {
        if sender == softButton {
            startTimer(for: "Soft")
        } else if sender == mediumButton {
            startTimer(for: "Medium")
        } else if sender == hardButton {
            startTimer(for: "Hard")
        }
    }
}
