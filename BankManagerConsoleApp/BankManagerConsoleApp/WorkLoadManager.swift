//
//  WorkLoadManager.swift
//  BankManagerConsoleApp
//
//  Created by jeremy, LJ on 2022/11/02.
//

struct WorkLoadManager {
    var taskQueue: CustomerQueue = CustomerQueue<Int>()
    
    mutating func checkManagers(managers: [BankManager]) {
        for manager in managers {
            if manager.isAvailable {
                guard let task = self.taskQueue.dequeue() else {
                    return
                }
                giveTask(to: manager, task: task)
            }
        }
    }
    
    func giveTask(to manager: BankManager, task: Int) {
        manager.work(customerNumber: task)
    }
}
