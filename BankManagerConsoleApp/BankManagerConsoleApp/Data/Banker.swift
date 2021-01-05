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
    
    func canEndTask(_ currentTime: Double) throws -> Bool {
        guard let startTime = taskStartTime?.percisionNumber else {
            throw BankError.invalidateBanker
        }
        let progressTime = currentTime - startTime
        return progressTime.percisionNumber >= processingTime.percisionNumber
    }
}
