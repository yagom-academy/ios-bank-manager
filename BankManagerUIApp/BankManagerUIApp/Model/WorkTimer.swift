//
//  WorkTimer.swift
//  BankManagerUIApp
//
//  Created by Erick, Serena on 2023/07/21.
//

import Foundation

protocol WorkTimerDelegate: AnyObject {
    func updateTime(_ time: String)
}

final class WorkTimer {
    private var timer: Timer?
    private var time: Double = WorkTimerNameSpace.zero
    private(set) var isRunning: Bool = false
    weak var delegate: WorkTimerDelegate?
    
    func start() {
        isRunning = true
        timer = Timer.scheduledTimer(timeInterval: WorkTimerNameSpace.aThousandth, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        if let timer = timer {
            RunLoop.current.add(timer, forMode: .common)
        }
    }
    
    func suspend() {
        isRunning = false
        timer?.invalidate()
    }
    
    func clear() {
        suspend()
        timer = nil
        time = WorkTimerNameSpace.zero
        delegate?.updateTime("00:00:000")
    }
    
    @objc private func updateTimer() {
        time += 0.001
        
        delegate?.updateTime("\(time.minute):\(time.second):\(time.millisecond)")
    }
}

private enum WorkTimerNameSpace {
    static let zero = 0.0
    static let aThousandth = 0.001
}
