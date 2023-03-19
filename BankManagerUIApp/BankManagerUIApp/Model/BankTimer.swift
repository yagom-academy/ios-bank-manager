//
//  BankTimer.swift
//  BankManagerUIApp
//
//  Created by vetto, kokkilE on 2023/03/17.
//

import UIKit

final class BankTimer {
    private var timer: Timer = .init()
    private var startTime: CFAbsoluteTime = .zero
    private var currentTime: CFAbsoluteTime = .zero
    private var previousTime: CFAbsoluteTime = .zero
    weak var updateTimerDelegate: UpdateTimerDelegate?
    
    init(_ updateTimerDelegate: UpdateTimerDelegate) {
        self.updateTimerDelegate = updateTimerDelegate
    }
    
    func startTimer() {
        if timer.isValid { return }
        
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(measureTime), userInfo: nil, repeats: true)
        
        startTime = CFAbsoluteTimeGetCurrent()
        previousTime = currentTime
    }

    func stopTimer() {
        timer.invalidate()
    }

    func clearTimer() {
        updateTimerDelegate?.updateTimeLabel(text: "00:00:000")
        timer.invalidate()
        previousTime = .zero
        currentTime = .zero
    }

    @objc private func measureTime() {
        currentTime = CFAbsoluteTimeGetCurrent() - startTime + previousTime
        
        let milliseconds = Int(currentTime * 1000) % 1000
        let seconds = (Int(currentTime * 1000) / 1000) % 60
        let minutes = (Int(currentTime * 1000) / (1000 * 60)) % 60
        
        let formattedTime = String(format: "%02d:%02d:%03d", minutes, seconds, milliseconds)
        updateTimerDelegate?.updateTimeLabel(text: formattedTime)
    }
}

