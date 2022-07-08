//
//  DepositOperation.swift
//  BankManagerConsoleApp
//
//  Created by 휴, 보리 on 2022/07/05.
//

import Foundation

class BankOperation: Operation {
    let task: BankTask
    let watingNumber: Int
    let timeInterval: UInt32
    
    init(task: BankTask, watingNumber: Int, timeInterval: UInt32) {
        self.task = task
        self.watingNumber = watingNumber
        self.timeInterval = timeInterval
        super.init()
    }
    
    override func main() {
        super.main()
        printTask()
    }
    
    private func printTask() {
        print("\(self.watingNumber)번 고객 \(self.task.description)업무 시작")
        usleep(timeInterval)
        print("\(self.watingNumber)번 고객 \(self.task.description)업무 완료")
    }
}
