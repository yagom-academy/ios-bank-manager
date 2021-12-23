//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by 이차민 on 2021/12/23.
//

import Foundation

class BankClerk {
    var bank: Bank?
    
    func startWork() {
        while true {
            guard let customer = bank?.customerQueue.dequeue() else {
                break
            }
            
            print("\(customer.turn)번 고객 업무 시작")
            Thread.sleep(forTimeInterval: TimeInterval(customer.processingTime))
            print("\(customer.turn)번 고객 업무 완료")
        }
    }
}
