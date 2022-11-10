//
//  BankManagerUIApp - TimeCalculator.swift
//  Created by Ayaan, Som, Dragon.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum TimeCalculator {
    static func calculate(_ time: Double) -> String {
        let minute: Int = Int(fmod(time / 60, 60))
        let second: Int = Int(fmod(time, 60))
        let milliSecond: Int = Int((time - floor(time)) * 1000)
        
        let minuteText: String = String(format: "%02d", minute)
        let secondText: String = String(format: "%02d", second)
        let milliSecondText: String = String(format: "%03d", milliSecond)
        
        return "\(minuteText):\(secondText):\(milliSecondText)"
    }
}
