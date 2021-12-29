//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class BankManager {
    var employee: Employee
    var bank: WaitingLineManageable?
    private let speaker = Speaker()
    private let calculator = Calculator()
    private var randomNumber = 0
    
    let firstEmployeeQueue = DispatchQueue(label: "FirstEmployeeQueue")
    let secondEmployeeQueue = DispatchQueue(label: "SecondEmployeeQueue")
    let thirdEmployeeQueue = DispatchQueue(label: "ThirdEmployeeQueue")
    
    let group1 = DispatchGroup()
    let group2 = DispatchGroup()
    let group3 = DispatchGroup()
    
    let semaphore1 = DispatchSemaphore(value: 1)
    let semaphore2 = DispatchSemaphore(value: 2)
    
    init(employee: Employee) {
        self.employee = employee
    }
    
    func work() {
        let openTime = CFAbsoluteTimeGetCurrent()
        
        lineUp()
        assignWork()
        
        let closeTime = CFAbsoluteTimeGetCurrent()
        
        reportResult(from: openTime, to: closeTime)
    }
}

//MARK: - Private Methods

extension BankManager {
    private func lineUp() {
        self.randomNumber = Int.random(in: 10...15)
        for number in 1...randomNumber {
            let bankWork = BankWork.allCases.randomElement()!
            let customer = Customer(waitingNumber: number, requestedWork: bankWork)
            
            switch customer.requestedWork {
            case .deposit:
                bank?.depositWaitingLine.enqueue(customer)
            case .loan:
                bank?.loanWaitingLine.enqueue(customer)
            }
        }
    }
    
    private func assignWork() {
//        let firstEmployeeQueue = DispatchQueue(label: "FirstEmployeeQueue")
//        let secondEmployeeQueue = DispatchQueue(label: "SecondEmployeeQueue")
//        let thirdEmployeeQueue = DispatchQueue(label: "ThirdEmployeeQueue")
//
//        let group1 = DispatchGroup()
//        let group2 = DispatchGroup()
//        let group3 = DispatchGroup()
//
//        let semaphore1 = DispatchSemaphore(value: 1)
//        let semaphore2 = DispatchSemaphore(value: 2)
        
        group1.notify(queue: firstEmployeeQueue) {
            print("group1 끝")
        }
        group2.notify(queue: secondEmployeeQueue) {
            print("group2 끝")
        }
        group3.notify(queue: thirdEmployeeQueue) {
            print("group3 끝")
        }
        
        repeat {
            // First Employee
            group1.enter()
            firstEmployeeQueue.asyncAfter(deadline: .now() + 0.7) {
                self.semaphore1.wait()
                self.employee.startDepositJob()
                guard let customer = self.bank?.depositWaitingLine.dequeue() else {
                    self.group1.leave()
                    
                    return
                }
                
                print("직원1 시작")
                self.semaphore1.signal()
                
                self.semaphore1.wait()
                self.employee.finishDepositJob(customer: customer)
                print("직원1 끝")
                self.semaphore1.signal()
                self.group1.leave()
            }
            
            // Second Employee
            group2.enter()
            secondEmployeeQueue.asyncAfter(deadline: .now() + 0.7) {
                self.semaphore1.wait()
                self.employee.startDepositJob()
                guard let customer = self.bank?.depositWaitingLine.dequeue() else {
                    self.group2.leave()
                    
                    return
                }
                
                print("직원2 시작")
                self.semaphore1.signal()
                
                self.semaphore1.wait()
                self.employee.finishDepositJob(customer: customer)
                print("직원2 끝")
                self.semaphore1.signal()
                self.group2.leave()
                
            }
        } while self.bank?.depositWaitingLine.isEmpty == false
        
        repeat {
            // Third Employee
            group3.enter()
            thirdEmployeeQueue.asyncAfter(deadline: .now() + 1.1) {
                self.employee.startLoanJob()
                self.employee.finishLoanJob()
                
                self.group3.leave()
            }
        } while self.bank?.loanWaitingLine.isEmpty == false
    }
    
    
    private func reportResult(from openTime: CFAbsoluteTime, to closeTime: CFAbsoluteTime) {
        guard let calculateResult = calculator.calculate(from: openTime, to: closeTime) else {
            return
        }
        
        speaker.speakClose(number: employee.customerCount, time: calculateResult)
    }
}
