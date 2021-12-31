//
//  Timer.swift
//  BankManagerUIApp
//
//  Created by Siwon Kim on 2021/12/30.
//

import Foundation

class BankTimer {
    private var startime = Date()
    private var timer: Timer?
    weak var delegate: TimerDelegate?
    
    func start() {
        startime = Date()
        timer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(timeUp), userInfo: nil, repeats: true)
    }
    
    @objc func timeUp() {
        let timeInterval = Date().timeIntervalSince(startime)
        let second = Int(fmod(timeInterval, 60))
        let miliSecond = Int((timeInterval - floor(timeInterval))*100)
        let nanoSecond = Int(floor(Double(timeInterval)*100000) - floor(Double(timeInterval)*100)*1000)
        delegate?.setupTimeLabel(second: second, milisecond: miliSecond, nanoSecond: nanoSecond)
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
    }
    
    func reset() {
        delegate?.setupTimeLabel(second: 0, milisecond: 0, nanoSecond: 0)
        timer?.invalidate()
        timer = nil
    }
}
