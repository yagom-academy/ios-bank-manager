//
//  DepositOperation.swift
//  BankManagerConsoleApp
//
//  Created by 휴, 보리 on 2022/07/05.
//

import Foundation

class LoanOperation: Operation {
    let task: String
    let watingNumber: Int
    
    init(task: String, watingNumber: Int) {
        self.task = task
        self.watingNumber = watingNumber
        super.init()
    }
    
    override func main() {
        super.main()
        print("\(self.watingNumber)번 고객 \(self.task)업무 시작")
        usleep(1100000)
        print("\(self.watingNumber)번 고객 \(self.task)업무 완료")
    }
}
