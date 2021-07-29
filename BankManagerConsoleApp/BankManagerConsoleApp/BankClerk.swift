//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by tae hoon park on 2021/07/29.
//

import Foundation

class BankClerk: Workable {
    var workTime: Double = 0.7
    
    func businessProcessing(for client: BankClient) {
        print("\(client.waittingNumber)번 고객 업무 시작")
//        Thread.sleep(forTimeInterval: workTime)
        print("\(client.waittingNumber)번 고객 업무 종료")
    }
}
