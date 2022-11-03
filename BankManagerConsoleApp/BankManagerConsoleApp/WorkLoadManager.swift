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
        guard let available = searchForAvailable() else {
            print("no available manager")
            return
        }
        guard let task = self.taskQueue.dequeue() else {
            return
        }
        
        giveTask(number: available, task: task)
    }
    
    func searchForAvailable() -> Int? {
        let managersCountRange = Array<Int>(0...(bankManagers.count - 1))
        for number in managersCountRange {
            if bankManagers[number].isAvailable {
                return number
            }
        }
        return nil
    }
    
    mutating func giveTask(number: Int, task: Int) {
        bankManagers[number].toggleAvailability()
        bankManagers[number].work(customerNumber: task)
        bankManagers[number].toggleAvailability()
    }
}
