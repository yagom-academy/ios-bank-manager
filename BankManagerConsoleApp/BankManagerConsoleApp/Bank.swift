//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Charlotte, Soll on 2021/07/30.
//

import Foundation

class Bank {
    private let bankManagers: [BankManager]
    private let depositManagerQueue = Queue<BankManager>()
    private let loanManagerQueue = Queue<BankManager>()
    private let waitList = Queue<Customer>()
    private var countOfCustomer: Int = 0
    private let numberFormatter = NumberFormatter()
    private let taskGroup = DispatchGroup.init()

    init(bankManagers: [BankManager]) {
        self.bankManagers = bankManagers
    }
    
    private func makeRandomCustomerNumber() {
        let minCustomerNumber = 10
        let maxCustomerNumber = 30
        
        countOfCustomer = Int.random(in: minCustomerNumber...maxCustomerNumber)
    }

    private func addCustomer() {
        (1...countOfCustomer).forEach { order in
            let customer = Customer(order)
            waitList.enqueue(customer)
        }
    }
    
    private func enqueueManagers() {
        bankManagers.filter { $0.task == .deposit }
            .forEach {
                depositManagerQueue.enqueue($0)
            }
        bankManagers.filter { $0.task == .loan }
            .forEach {
                loanManagerQueue.enqueue($0)
            }
    }
    
    private func assignTask() {
        let taskQueue = DispatchQueue(label: "TaskQueue", attributes: .concurrent)
        let semaphore = DispatchSemaphore.init(value: bankManagers.count)
        
        while waitList.isEmpty() == false {
            guard let customer = self.waitList.dequeue() else {
                return
            }
            switch customer.task {
            case .deposit:
                if let depositManager = self.depositManagerQueue.dequeue() {
                    semaphore.wait()
                    taskQueue.async(group: taskGroup) {
                        depositManager.startWork(customer)
                        semaphore.signal()
                    }
                    self.depositManagerQueue.enqueue(depositManager)
                }
            case .loan:
                if let loanManager = self.loanManagerQueue.dequeue() {
                    semaphore.wait()
                    taskQueue.async(group: taskGroup) {
                        loanManager.startWork(customer)
                        semaphore.signal()
                    }
                    self.loanManagerQueue.enqueue(loanManager)
                }
            }
        }
    }
    
    private func checkTotalTime(of process: () -> ()) -> Double {
        let startTime = CFAbsoluteTimeGetCurrent()
        process()
        let processTime = CFAbsoluteTimeGetCurrent() - startTime
        return processTime
    }
    
    private func printWorkDone(_ time: Double) {
        numberFormatter.roundingMode = .floor
        numberFormatter.maximumSignificantDigits = 2
        
        if let formattedTime = numberFormatter.string(for: time) {
            print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(countOfCustomer)이며, 총 업무시간은 \(formattedTime)초입니다.")
        }
    }
    
    func openBank() {
        let totalWorkTime = checkTotalTime {
            makeRandomCustomerNumber()
            addCustomer()
            enqueueManagers()
            assignTask()
        }
        taskGroup.notify(queue: .global()) {
            self.printWorkDone(totalWorkTime)
        }
    }
}
