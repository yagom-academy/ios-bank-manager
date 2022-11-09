//
//  BankManagerUIApp - StopWatch.swift
//  Created by Ayaan, Som, Dragon.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct StopWatch {
    private var timer: DispatchSourceTimer?
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
        }
    }
    
    mutating func pause() {
        timer?.suspend()
    }
    
    mutating func cancel() {
        stopWatchDelegate?.reset()
        timer?.cancel()
        timer = nil
    }
}
