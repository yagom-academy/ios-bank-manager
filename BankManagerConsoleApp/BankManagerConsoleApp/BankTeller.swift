//
//  BankTeller.swift
//  BankManagerConsoleApp
//
//  Created by 천수현 on 2021/04/27.
//

import Foundation

protocol BankTeller {
    func handleBanking(ofCustomerNumber customerNumber: Int)
}

extension BankTeller {
    func handleBanking(ofCustomerNumber customerNumber: Int) {
        let queue = OperationQueue()
        let startBlock = BlockOperation {
            print("\(customerNumber)번 고객 업무 시작")
            usleep(700_000)
            print("\(customerNumber)번 고객 업무 완료")
        }
        queue.addOperations([startBlock], waitUntilFinished: true)
    }
}
