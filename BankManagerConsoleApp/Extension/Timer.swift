//
//  Timer.swift
//  BankManagerConsoleApp
//
//  Created by 박태현 on 2021/08/04.
//

import Foundation

extension Timer {
    static func calculateDuration(about targetClosure: () -> Void) -> TimeInterval {
        let currentTime = Date()
        targetClosure()
        let totalTime = -currentTime.timeIntervalSinceNow
        
        return totalTime
    }
}
