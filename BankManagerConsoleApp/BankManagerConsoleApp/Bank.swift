//  Bank.swift
//  BankManagerConsoleApp
//  Created by Baem & Bella on 2022/11/02.

import Foundation

struct Bank {
    private let manager = BankManager()
    private var lineOfCustomer = LinkedList<Customer>()
    let group = DispatchGroup()
    
    mutating func selectMenu() {
        print(" 1 : 은행개점\n 2 : 종료\n입력 :", terminator: " ")
        switch receiveUserInput() {
        case "1":
            openBank()
        case "2":
            return
        default:
            print("잘못된 입력값입니다. 다시 입력해주세요.")
            selectMenu()
        }
    }
    
    private func receiveUserInput() -> String {
        guard let userInput = readLine() else {
            return receiveUserInput()
        }
        return userInput
    }
    
    mutating private func openBank() {
        let totalCustomer = Int.random(in: 10...30)
        
        listUpCustomer(totalCustomer)
        startTask()
        group.wait()
        taskEnd()
        selectMenu()
    }
    
    mutating private func listUpCustomer(_ customerCount: Int) {
        for customerIndex in 1...customerCount {
            lineOfCustomer.enqueue(value: Customer(waitingNumber: customerIndex, purposeOfServie: randomTask()))
        }
    }
    
    private func randomTask() -> Task {
        Int.random(in: 1...2) == 1 ? .deposit : .loan
    }
    
    private mutating func startTask() {
        let loanSemaphore = DispatchSemaphore(value: 1)
        let depoSemaphore = DispatchSemaphore(value: 2)
        
        while lineOfCustomer.isEmpty == false {
            guard let currentCustomer = lineOfCustomer.dequeue() else { break }
            
            switch currentCustomer.purposeOfServie {
            case .deposit:
                DispatchQueue.global().async(group: group) { [self] in
                    depoSemaphore.wait()
                    manager.task(customer: currentCustomer)
                    manager.addDepositTime()
                    depoSemaphore.signal()
                }
            case .loan:
                DispatchQueue.global().async(group: group) { [self] in
                    loanSemaphore.wait()
                    manager.task(customer: currentCustomer)
                    manager.addLoanTime()
                    loanSemaphore.signal()
                }
            }
            manager.addCustomer()
        }
    }
    
    func taskEnd() {
        let time = manager.depositTimer > manager.loanTimer ? manager.depositTimer : manager.loanTimer
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(manager.processedCustomer)명이며, 총 업무시간은 \(time)초입니다.")
    }
}
