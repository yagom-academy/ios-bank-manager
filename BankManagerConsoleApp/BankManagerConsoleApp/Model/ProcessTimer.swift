//
//  ProcessTimer.swift
//  BankManagerConsoleApp
//
//  Created by Rowan, 릴라 on 2023/03/14.
//

import Foundation

enum ProcessTimer {
    
    static func calculateProcessTime(for process: () -> Void) -> CFAbsoluteTime {
        let startTime = CFAbsoluteTimeGetCurrent()
        process()
        let processTime = CFAbsoluteTimeGetCurrent() - startTime
        
        return processTime
    }
}
