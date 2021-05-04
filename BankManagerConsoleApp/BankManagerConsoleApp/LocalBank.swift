//
//  LocalBank.swift
//  BankManagerConsoleApp
//
//  Created by 윤재웅 on 2021/05/04.
//

import Foundation

final class LocalBank {
    var bankWindow = OperationQueue()
    var workTime = Double.zero
    var taskList: [LocalBankTask] = []
    var headBank: HeadBank?
    
    func serveClient(_ bankTeller: Int) {
        bankWindow.maxConcurrentOperationCount = bankTeller
        let totalCustomer = acceptClient()
        for waitNumber in 1...totalCustomer {
            guard let localBankTask = LocalBankTask(UInt(waitNumber)) else {
                return
            }
            assignPriority(localBankTask)
            taskList.append(localBankTask)
            localBankTask.completionBlock = {
                self.workTime += localBankTask.workType.duration
            }
        }
        bankWindow.addOperations(taskList, waitUntilFinished: true)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomer)명이며, 총 업무시간은\(String(format: "%.2f", workTime))초 입니다.")
    }
    
    private func acceptClient() -> Int {
        return Int.random(in: 10...30)
    }
    
    private func assignPriority(_ task: LocalBankTask) {
        switch task.creditRate {
        case .vvip:
            return task.queuePriority = .high
        case .vip:
            return task.queuePriority = .normal
        case .normal:
            return task.queuePriority = .low
        }
    }
}

