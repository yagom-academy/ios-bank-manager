//
//  BusinessTimer.swift
//  BankManagerUIApp
//
//  Created by brody, christy, harry on 2023/03/16.
//

import Foundation

enum BusinessTimer {
    enum TimerState {
        case suspended
        case resumed
        case finished
    }
    
    static var timer: DispatchSourceTimer?
    static var state: TimerState = .finished
    
    static func start(handler: @escaping () -> ()) {
        if state == .finished {
            timer = DispatchSource.makeTimerSource(queue: .main)
            timer?.schedule(deadline: .now(), repeating: 0.001)
            timer?.setEventHandler(handler: handler)
            timer?.resume()
            state = .resumed
        } else if state == .suspended {
            timer?.resume()
        }
    }
    
    static func pause() {
        if state == .resumed {
            timer?.suspend()
            state = .suspended
        }
    }
    
    static func reset() {
        timer?.cancel()
        timer = nil
        state = .finished
    }
}
