//
//  HeadOfficeBankTask.swift
//  BankManagerConsoleApp
//
//  Created by sookim on 2021/05/04.
//

import Foundation

class HeadOfficeBankTask: Operation {
    
    private var waitingNumber: Int
    private var customerGrade: CustomerGrade

    init(waitingNumber: Int, customerGrade: CustomerGrade) {
        self.waitingNumber = waitingNumber
        self.customerGrade = customerGrade
    }

    override func main() {
        print("🟡\(waitingNumber)번 \(customerGrade.name)고객 대출심사 시작")
        Thread.sleep(forTimeInterval: 0.5)
        print("🟢\(waitingNumber)번 \(customerGrade.name)고객 대출심사 완료")
    }

}
