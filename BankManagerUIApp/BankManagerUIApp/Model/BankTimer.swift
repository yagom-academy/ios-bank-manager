//
//  BankTimer.swift
//  BankManagerUIApp
//
//  Created by 예거 on 2022/01/02.
//

import Foundation

class BankTimer {
    private var timer: Timer?
    private var elapsedMilisec: Int = .zero
    private var formattedMilisec: String {
        var converted = ((elapsedMilisec / 60000 * 100000) + (elapsedMilisec % 60000)).description
        while converted.count <= 6 {
            converted.insert(.zero, at: converted.startIndex)
        }
        converted.insert(.colon, at: converted.index(converted.endIndex, offsetBy: -3))
        converted.insert(.colon, at: converted.index(converted.endIndex, offsetBy: -6))
        return converted
    }
    weak var delegate: BankTimerDisplayer?
    
    func activate() {
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerShouldUpdate), userInfo: nil, repeats: true)
        RunLoop.current.add(timer ?? Timer(), forMode: .common)
    }
    
    func pause() {
        timer?.invalidate()
    }
    
    func reset() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc
    func timerShouldUpdate() {
        elapsedMilisec += 1
        delegate?.bank(didUpdateTimer: formattedMilisec)
    }
}
