//
//  WorkLoadManager.swift
//  BankManagerConsoleApp
//
//  Created by jeremy, LJ on 2022/11/02.
//

struct WorkLoadManager {
    var taskQueue: CustomerQueue = CustomerQueue<Int>()
    var bankManagers: [BankManager]  = [BankManager()]
    
    mutating func giveWorkToAvailableManager() {
        let managersCountRange = Array<Int>(0...(bankManagers.count - 1))
        for number in managersCountRange {
            if bankManagers[number].isAvailable {
                guard let task = self.taskQueue.dequeue() else {
                    return
                }
                giveTask(number: number, task: task)
            }
        }
    }
    
    mutating func giveTask(number: Int, task: Int) {
        bankManagers[number].work(customerNumber: task)
    }
}
