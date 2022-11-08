//  Bank.swift
//  BankManagerConsoleApp
//  Created by Baem & Bella on 2022/11/02.

import Foundation

struct Bank {
    private let manager = BankManager()
    private var lineOfCustomer = LinkedList<Customer>()
    private let group = DispatchGroup()
    private let loanFront = 1
    private let depositFront = 2
    
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
        let loanSemaphore = DispatchSemaphore(value: loanFront)
        let depoSemaphore = DispatchSemaphore(value: depositFront)
        
        while lineOfCustomer.isEmpty == false {
            guard let currentCustomer = lineOfCustomer.dequeue() else { break }
            
            switch currentCustomer.purposeOfServie {
            case .deposit:
                dispatchTask(of: currentCustomer, using: depoSemaphore)
            case .loan:
                dispatchTask(of: currentCustomer, using: loanSemaphore)
            }
        }
    }
    
    private func dispatchTask(of currentCustomer: Customer, using semaphore: DispatchSemaphore) {
        DispatchQueue.global().async(group: group) {
            semaphore.wait()
            manager.task(customer: currentCustomer)
            manager.addLoanTime()
            semaphore.signal()
            manager.addCustomer()
        }
    }
    
    func taskEnd() {
        var taskTime = manager.depositTimer > manager.loanTimer ? manager.depositTimer : manager.loanTimer
        taskTime = Double(round(taskTime * 100) / 100)
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(manager.processedCustomer)명이며, 총 업무시간은 \(taskTime)초입니다.")
        manager.managerClear()
    }
}
