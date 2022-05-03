//
//  Measurable.swift
//  BankManagerConsoleApp
//
//  Created by Taeangel, Tiana on 2022/05/03.
//

import Foundation

protocol Measurable { }

extension Measurable {
    func measureTime(of task: () -> Void) -> Double {
        let startTime = CFAbsoluteTimeGetCurrent()
        task()
        let durationTime = CFAbsoluteTimeGetCurrent() - startTime
        
        return Double(durationTime)
    }
}
