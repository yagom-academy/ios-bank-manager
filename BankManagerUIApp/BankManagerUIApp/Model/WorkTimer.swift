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

class WorkTimer {
    private var timer: Timer?
    private var startTime: TimeInterval = WorkTimerNameSpace.zero
    private var elapsedTime: TimeInterval = WorkTimerNameSpace.zero
    weak var delegate: WorkTimerDelegate?
    var isRunning: Bool = false
    
    func start() {
        isRunning = true
        
        if timer == nil {
            startTime = Date.timeIntervalSinceReferenceDate - elapsedTime
            timer = Timer.scheduledTimer(timeInterval: WorkTimerNameSpace.aThousandth, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }
    
    func suspend() {
        isRunning = false
        timer?.invalidate()
        timer = nil
        elapsedTime = Date.timeIntervalSinceReferenceDate - startTime
    }
    
    func clear() {
        suspend()
        startTime = WorkTimerNameSpace.zero
        elapsedTime = WorkTimerNameSpace.zero
        delegate?.updateTime("00:00:000")
    }
    
    @objc private func updateTimer() {
        let currentTime = Date.timeIntervalSinceReferenceDate
        let runTime = currentTime - startTime
        let runTimeIntger = Int(runTime)
        let milliseconds = String(format: "%03d", Int(runTime.truncatingRemainder(dividingBy: 1) * 1000))
        
        delegate?.updateTime("\(runTimeIntger.minutes):\(runTimeIntger.seconds):\(milliseconds)")
    }
}

enum WorkTimerNameSpace {
    static let zero = 0.0
    static let aThousandth = 0.001
}
