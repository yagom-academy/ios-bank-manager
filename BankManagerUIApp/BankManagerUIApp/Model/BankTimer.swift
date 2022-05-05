//
//  BankTimer.swift
//  BankManagerUIApp
//
//  Created by 허윤영 on 05/05/2022.
//

import Foundation

protocol TimerDelegate: AnyObject {
    func applyTimerToLabel(second: Int, milisecond: Int, nanosecond: Int)
}

final class BankTimer {
    private var timer: Timer?
    private var currentTime: Double = 0.0
    weak var delegate: TimerDelegate?
    
    deinit {
        stop()
    }

    func start() {
        timer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(countUp), userInfo: nil, repeats: true)
    }

    func stop() {
        timer?.invalidate()
    }

    func reset() {
        timer?.invalidate()
        timer = nil
    }

    @objc func countUp() {
        currentTime += 0.0001
        let second = Int(fmod(currentTime, 60))
        let milisecond = Int((currentTime - floor(currentTime))*100)
        let nanosecond = Int(floor(Double(currentTime)*100000) - floor(Double(currentTime)*100)*1000)
        delegate?.applyTimerToLabel(second: second, milisecond: milisecond, nanosecond: nanosecond)
    }
}
