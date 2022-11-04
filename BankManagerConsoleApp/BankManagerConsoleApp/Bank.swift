//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by jeremy, LJ on 2022/11/02.
//

typealias App = Displayable & SelectableMenu & Runnable
struct Bank: App {
    private var workLoadManager: WorkLoadManager = WorkLoadManager()
    
    mutating func openBank() {
        var workCount: Int = 0

        letCustomersIn()
        while workLoadManager.taskQueue.isEmpty() == false {
            workLoadManager.giveWorkToAvailableManager()
            workCount += 1
        }
        
        closeBank(with: workCount)
    }
    
    private mutating func letCustomersIn() {
        let randomIntNumber = Int.random(in: 10...30)
        
        let customerCount = Array<Int>(1...randomIntNumber)
        customerCount.forEach {
            workLoadManager.taskQueue.enqueue(data: $0)
        }
    }
    
    private func closeBank(with workCount: Int) {
        let totalWorkingTime: Double = Double(workCount) * 0.7
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(workCount)명이며, 총 업무시간은 \(totalWorkingTime.formattedToString)초입니다.")
    }
}
