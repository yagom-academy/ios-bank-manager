//
//  BankTimer.swift
//  BankManagerUIApp
//
//  Created by 허윤영 on 05/05/2022.
//

import Foundation

final class BankTimer {
    private var timer: Timer?
    private var startTime: Date = Date()

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
        let timeInterval = Date().timeIntervalSince(startTime)
        let second = Int(fmod(timeInterval, 60))
        let miliSecond = Int((timeInterval - floor(timeInterval))*100)
        let nanoSecond = Int(floor(Double(timeInterval)*100000) - floor(Double(timeInterval)*100)*1000)
    }
}
