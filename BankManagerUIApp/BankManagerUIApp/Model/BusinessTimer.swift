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
        case canceled
        case finished
    }
    static let timer = DispatchSource.makeTimerSource(queue: .main)
    static var state: TimerState = .finished
    
    static func start(handler: @escaping () -> ()) {
        if state == .finished {
            timer.schedule(deadline: .now(), repeating: 0.1)
            timer.setEventHandler(handler: handler)
            timer.activate()
            state = .resumed
        } else if state == .suspended {
            timer.resume()
        }
    }
    
    static func pause() {
        if state == .resumed {
            timer.suspend()
            state = .suspended
        }
    }
    
    static func reset() {
        timer.cancel()
        state = .finished
    }
}
