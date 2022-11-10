//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by jeremy, LJ on 2022/11/02.
//
import Foundation

typealias App = Displayable & SelectableMenu & Runnable
struct Bank: App {
    private var bankManagers: BankManagers = BankManagers()
    private let randomCustomersNumber = Int.random(in: 10...30)
    
    mutating func openBank() {
        letCustomersIn()
        let time = CFAbsoluteTimeGetCurrent()
        bankManagers.work()
        let endTime = CFAbsoluteTimeGetCurrent() - time
        closeBank(time: endTime)
    }
    
    private mutating func letCustomersIn() {
        let customerCount = Array<Int>(1...randomCustomersNumber)
        customerCount.forEach {
            guard let data = bankManagers.makeDispatchWorkItem(number: $0) else {
                return
            }
            bankManagers.taskQueue.enqueue(data: data)
        }
    }
    
    private func closeBank(time: Double) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(randomCustomersNumber)명이며, 총 업무시간은 \(time.formattedToString)초입니다.")
    }
}
