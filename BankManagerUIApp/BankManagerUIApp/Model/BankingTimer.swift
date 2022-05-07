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
    
}
