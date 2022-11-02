//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by jeremy, LJ on 2022/11/02.
//

struct Bank {
    private var bankManagers: [BankManager]  = []
    private var workLoadManager: WorkLoadManager = WorkLoadManager()

    mutating func openBank() {
        print("openBank")
        let randomIntNumber = Int.random(in: 10...30)
        let customerCount = Array<Int>(1...randomIntNumber)
        customerCount.forEach {
            workLoadManager.taskQueue.enqueue(data: $0)
        }
        
        while workLoadManager.taskQueue.isEmpty() == true {
            workLoadManager.checkManagers(managers: bankManagers)
        }
        
        closeBank(with: randomIntNumber)
    }
    
    func closeBank(with workCount: Int) {
        let totalWorkingTime: Double = Double(workCount) * 0.7
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(workCount)명이며, 총 업무시간은 \(totalWorkingTime.formatted)초입니다.")
    }
}

