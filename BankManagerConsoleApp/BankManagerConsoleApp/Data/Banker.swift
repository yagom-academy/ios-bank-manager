//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Wonhee on 2021/01/04.
//

import Foundation

struct Banker {
    let processingTime: Double
    var taskStartTime: Double?
    
    mutating func setTaskStartTime(_ time: Double) {
        self.taskStartTime = time
    }
}
