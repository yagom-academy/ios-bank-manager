//
//  HeadOfficeBankTask.swift
//  BankManagerConsoleApp
//
//  Created by sookim on 2021/05/04.
//

import Foundation

class HeadOfficeBankTask: Operation {
    private var waitingNumber: Int
   
    init(waitingNumber: Int) {
        self.waitingNumber = waitingNumber
    }
    
    override func main() {
        print(waitingNumber, "대출 심사 시작")
        Thread.sleep(forTimeInterval: 0.5)
        print(waitingNumber, "대출 심사 종료")
    }
}
