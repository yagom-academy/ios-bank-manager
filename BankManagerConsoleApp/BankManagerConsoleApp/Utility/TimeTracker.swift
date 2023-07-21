//
//  TimeTracker.swift
//  BankManagerConsoleApp
//
//  Created by Dasan & Mary on 2023/07/19.
//

import Foundation

struct TimeTracker {
    var startTime: CFAbsoluteTime = CFAbsoluteTime()
    var endTime: CFAbsoluteTime = CFAbsoluteTime()
    var duration: Double {
        return endTime - startTime
    }
}
