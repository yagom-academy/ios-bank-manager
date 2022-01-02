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
    var bank: Bank?
    
    func activate() {
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerShouldUpdate), userInfo: nil, repeats: true)
    }
    
    func pause() {
        timer?.invalidate()
    }
    
    func reset() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc
    private func timerShouldUpdate() {
        elapsedMilisec += 1
        bank?.delegate?.bank(didUpdateTimer: formatMilisecToString())
    }
    
    private func formatMilisecToString() -> String {
        var converted = ((elapsedMilisec / 60000 * 100000) + (elapsedMilisec % 60000)).description
        while converted.count <= 6 {
            converted.insert(.zero, at: converted.startIndex)
        }
        converted.insert(.colon, at: converted.index(converted.endIndex, offsetBy: -3))
        converted.insert(.colon, at: converted.index(converted.endIndex, offsetBy: -6))
        return converted
    }
}
