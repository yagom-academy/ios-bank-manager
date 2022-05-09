//
//  BankingTimer.swift
//  BankManagerUIApp
//
//  Created by marisol on 2022/05/07.
//

import Foundation

struct BankingTimer {
    
    enum TimerState {
        case timerRunning
        case timerPaused
        case timerNotRunning
    }
    
    var startTime: Date = Date()
    var durationTime: TimeInterval = 0
    var timer: DispatchSourceTimer?
    var currentTimerState: TimerState = .timerNotRunning
    weak var delegate: WorkTimeSendable?
    
    mutating func startTimer() {
        startTime = Date()
        if timer == nil {
            timer = DispatchSource.makeTimerSource(flags: [], queue: .main)
            timer?.schedule(deadline: .now(), repeating: 0.01)
        }

        timer?.setEventHandler(handler: { [self] in
            delegate?.updateWorkTime(startTime, durationTime)
        })

        if currentTimerState != .timerRunning {
            currentTimerState = .timerRunning
            timer?.resume()
        }
    }
    
    mutating func pauseTimer() {
        currentTimerState = .timerPaused
        timer?.suspend()
        let timeInterval = Date().timeIntervalSince(self.startTime)
        durationTime += timeInterval
    }
    
    mutating func clearTimer() {
        if currentTimerState != .timerRunning {
            timer?.resume()
        }
        
        timer?.cancel()
        currentTimerState = .timerNotRunning
        timer = nil
        durationTime = 0
    }

}
