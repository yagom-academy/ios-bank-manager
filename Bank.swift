//
//  BankManager.swift
//  Created by yagom.
//  Copyright Donnie, Safari. All rights reserved.
//

import Foundation

struct Bank {
    let bankClerkCount: Int
    let bankWaitingQueue = BankWaitingQueue.init(LinkedList<Customer>())
    
    init(bankClerkCount: Int) {
        self.bankClerkCount = bankClerkCount
    }
    
    func open() {
        printMenu()
        guard let input = readLine() else { return }
        
        switch input {
        case "1":
            startWork()
        case "2":
            return
        default:
            print("잘못된 입력입니다.")
            open()
        }
    }
    
    private func printMenu() {
        print("""
                1 : 은행개점
                2 : 종료
                입력 :
                """, terminator: " ")
    }
    
    private func startWork() {
        let customers = Int.random(in: 10...30)
        for number in 1...customers {
            bankWaitingQueue.enqueue(Customer(numberTicket: number))
        }
        
        let bankWindows = DispatchSemaphore(value: bankClerkCount)
        let group = DispatchGroup()
        let startTime = CFAbsoluteTimeGetCurrent()
     
        while !bankWaitingQueue.isEmpty {
            guard let customer = bankWaitingQueue.dequeue() else { return }
            DispatchQueue.global().async(group: group) {
                bankWindows.wait()
                BankClerk().processTask(for: customer)
                bankWindows.signal()
            }
        }
        group.wait()
        let durationTime = CFAbsoluteTimeGetCurrent() - startTime
        let digit: Double = pow(10, 2)
        
        finishWork(customers, round(durationTime * digit) / digit)
        open()
    }
    
    func finishWork(_ customers: Int, _ totalWorkTime: Double) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customers)명이며, 총 업무시간은 \(totalWorkTime)초 입니다.")
    }
}
