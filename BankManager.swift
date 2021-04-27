//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

protocol Bank: class {
    var numberTicket: Int { get set }
    func closeAlert()
}

extension Bank {
    var numerTicket: Int {
        numberTicket += 1
        return numberTicket
    }
}

protocol BankTeller {
    func handleBanking()
    func startTask()
    func endTask()
}

extension BankTeller {
    func handleBanking() {
        let queue = OperationQueue()
        let startBlock = BlockOperation {
            startTask()
            sleep(1)
            endTask()
        }
        queue.addOperations([startBlock], waitUntilFinished: true)
    }
    
    func startTask() {
        print("고객 업무 시작")
    }
    
    func endTask() {
        print("고객 업무 완료")
    }
}

protocol Customer {
    var ticketNumber: Int { get }
}
