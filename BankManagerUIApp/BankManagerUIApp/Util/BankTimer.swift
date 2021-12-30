//
//  Timer.swift
//  BankManagerUIApp
//
//  Created by Siwon Kim on 2021/12/30.
//

import Foundation

class BankTimer {
    var startime = Date()
    var timer: Timer?
    
    func start() {
        startime = Date()
        timer = Timer.scheduledTimer(timeInterval: 0.0001, target: self, selector: #selector(timeUp), userInfo: nil, repeats: true)
    }
    
    @objc func timeUp() {
        let timeInterval = Date().timeIntervalSince(startime)
        let second = Int(fmod(timeInterval, 60))
        let miliSecond = Int((timeInterval - floor(timeInterval))*100)
        let nanoSecond = floor(Double(timeInterval)*100000) - floor(Double(timeInterval)*100)*1000
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
    }
}
