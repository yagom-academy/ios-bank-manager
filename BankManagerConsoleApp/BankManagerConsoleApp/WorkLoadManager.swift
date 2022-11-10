//
//  WorkLoadManager.swift
//  BankManagerConsoleApp
//
//  Created by jeremy, LJ on 2022/11/02.
//
import Foundation

struct WorkLoadManager {
    var taskQueue: CustomerQueue = CustomerQueue<(Task, DispatchWorkItem)>()
    let loanQueue: DispatchQueue = DispatchQueue(label: "loanQueue", attributes: .concurrent)
    let loanSemaphore = DispatchSemaphore(value: 1)
    let depositQueue: DispatchQueue = DispatchQueue(label: "depositQueue", attributes: .concurrent)
    let depositSemaphore = DispatchSemaphore(value: 2)
    let banking: DispatchGroup = DispatchGroup()
    
    func makeDispatchWorkItem(number: Int) -> (Task, DispatchWorkItem)? {
        guard let task = Task(rawValue: Int.random(in: 1...2)) else { return nil }
        
        switch task {
        case .deposit:
            let deposit = DispatchWorkItem {
                depositSemaphore.wait()
                print("\(number)번째 고객, \(task)업무 진행")
                usleep(700000)
                depositSemaphore.signal()
            }
            deposit.notify(queue: depositQueue) {
                print("\(number)번째 고객, \(task)업무 완료")
            }
            return (task, deposit)
        case .loan:
            let loan = DispatchWorkItem {
                loanSemaphore.wait()
                print("\(number)번째 고객, \(task)업무 진행")
                usleep(1100000)
                loanSemaphore.signal()
            }
            loan.notify(queue: depositQueue) {
                print("\(number)번째 고객, \(task)업무 완료")
            }
            return (task, loan)
        }
    }
    
    mutating func work() {
        while taskQueue.isEmpty() != true {
            guard let (taskType, dispatchWorkItem) = taskQueue.dequeue() else { return }
            
            switch taskType {
            case .deposit:
                depositQueue.async(group: banking, execute: dispatchWorkItem)
            case .loan:
                loanQueue.async(group: banking, execute: dispatchWorkItem)
            }
        }
        
        banking.wait()
    }
}
