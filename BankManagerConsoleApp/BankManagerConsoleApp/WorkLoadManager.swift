//
//  WorkLoadManager.swift
//  BankManagerConsoleApp
//
//  Created by 유제민 on 2022/11/02.
//

struct WorkLoadManager {
    var taskQueue: CustomerQueue = CustomerQueue<Int>()
    
    mutating func checkManagers(managers: [BankManager]) {
        for manager in managers {
            if manager.isAvailable {
                let task = self.taskQueue.dequeue()
                giveTask(to: manager, task: task)
            }
        }
    }
    
    func giveTask(to manager: BankManager, task: Int) {
        manager.work(customerNumber: task)
    }
}

