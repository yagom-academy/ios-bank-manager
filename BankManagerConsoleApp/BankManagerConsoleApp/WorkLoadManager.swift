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
        guard let available = searchForAvailableManager(),
              let task = getNextTask() else {
            print("no available manager")
            return
        }

        giveTask(number: available, task: task)
    }
    
    private mutating func getNextTask() -> Int? {
        guard let task = self.taskQueue.dequeue() else {
            return nil
        }
        return task
    }
    
    private func searchForAvailableManager() -> Int? {
        let managersCountRange = Array<Int>(0...(bankManagers.count - 1))
        let number = managersCountRange.first(
            where: {
            bankManagers[$0].isAvailable
        })

        return number
    }
    
    private mutating func giveTask(number: Int, task: Int) {
        bankManagers[number].toggleAvailability()
        bankManagers[number].work(customerNumber: task)
        bankManagers[number].toggleAvailability()
    }
}
