import UIKit

class TimerLabel: UILabel {

    var count: Double = 0
    var timer: Timer!

    override init(frame: CGRect) {
        super.init(frame: frame)
        text = "00:00:000"
        self.textAlignment = .center
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

    }

    func startTimer() {
        self.timer = .scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }

    @objc func updateTime() {
        count += 0.001
        self.text = updateLabel()
    }

    func updateLabel() -> String {
        let minute = Int(count / 60)
        let second = Int(count) % 60
        let milliSecond = Int((count - floor(count)) * 1000)
        return String(format: "%02d", minute) + ":" + String(format: "%02d", second) + ":" + String(format: "%03d", milliSecond)
    }
    
    func stop() {
        timer.invalidate()
    }
    
    func reset() {
        stop()
        text = "00:00:000"
        count = 0
    }

}
