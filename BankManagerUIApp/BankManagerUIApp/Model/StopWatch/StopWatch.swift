//
//  BankManagerUIApp - StopWatch.swift
//  Created by Ayaan, Som, Dragon.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum StopWatchState {
    case nonPause
    case pause
}

struct StopWatch {
    private var timer: DispatchSourceTimer?
    private var stopWatchState: StopWatchState = .nonPause
    private weak var stopWatchDelegate: StopWatchDelegate?
    
    mutating func setDelegate(to stopWatchDelegate: StopWatchDelegate) {
        self.stopWatchDelegate = stopWatchDelegate
    }
    
    mutating func start() {
        if timer == nil {
            timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)
            timer?.schedule(deadline: .now(), repeating: 0.001)
            timer?.setEventHandler(handler: { [self] in
                stopWatchDelegate?.addOneMilliSecond()
            })
            timer?.resume()
        } else if stopWatchState == .pause {
            timer?.resume()
            stopWatchState = .nonPause
        }
    }
    
    mutating func pause() {
        timer?.suspend()
        stopWatchState = .pause
    }
    
    mutating func cancel() {
        stopWatchDelegate?.reset()
        stopWatchState = .nonPause
        timer?.cancel()
        timer = nil
    }
}
