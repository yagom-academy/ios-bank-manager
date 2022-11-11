//
//  BankManagers.swift
//  BankManagerConsoleApp
//
//  Created by jeremy, LJ on 2022/11/10.
//
import Foundation

struct BankManagers {
    typealias Ticket = (Task, DispatchWorkItem)
    var taskQueue: CustomerQueue = CustomerQueue<Ticket>()
    
    private let loanQueue: DispatchQueue = DispatchQueue(label: "loanQueue", attributes: .concurrent)
    private let loanSemaphore = DispatchSemaphore(value: 1)
    
    private let depositQueue: DispatchQueue = DispatchQueue(label: "depositQueue", attributes: .concurrent)
    private let depositSemaphore = DispatchSemaphore(value: 2)
   
    private let banking: DispatchGroup = DispatchGroup()
    
    func makeDispatchWorkItem(number: Int) -> Ticket? {
        guard let task = Task(rawValue: Int.random(in: 1...2)) else {
            return nil
        }
        
        switch task {
        case .deposit:
            let deposit = DispatchWorkItem {
                depositSemaphore.wait()
                task.startMessage(number: number)
                usleep(700000)
                depositSemaphore.signal()
            }
            deposit.notify(queue: depositQueue) {
                task.finishMessage(number: number)
            }
            return (task, deposit)
        case .loan:
            let loan = DispatchWorkItem {
                loanSemaphore.wait()
                task.startMessage(number: number)
                usleep(1100000)
                loanSemaphore.signal()
            }
            loan.notify(queue: loanQueue) {
                task.finishMessage(number: number)
            }
            return (task, loan)
        }
    }
    
    mutating func work() {
        while taskQueue.isEmpty() != true {
            guard let (taskType, dispatchWorkItem): Ticket = taskQueue.dequeue() else { return }
            
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
