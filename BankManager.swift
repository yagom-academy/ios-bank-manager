//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var numberOfClients = UInt.random(in: 10...30)

class Client {
    let waitingNumber: UInt

    init(waitingNumber: UInt) {
        self.waitingNumber = waitingNumber
    }
}

protocol BankTellerRole {
    func recieveClient(_ client: UInt)
}

class BankTeller: BankTellerRole {
    func recieveClient(_ client: UInt) {
        print("\(client)번 업무처리 시작")
        usleep(700000)
        print("\(client)번 업무처리 완료")
    }
}

class Bank {
    private let bankTeller = BankTeller()
    var waitingLine: Queue<UInt>?
    var timeRequired: Double = 0.0
    
    func arrangeClients() {
        (1...numberOfClients).forEach { (waitingNumber) in
            let client = Client.init(waitingNumber: waitingNumber)
            waitingLine?.enqueue(data: client.waitingNumber)
        }
    }
    
    func startWork() {
        guard let clientNumber = waitingLine?.peek()?.data else {
            return
        }
        bankTeller.recieveClient(clientNumber)
        waitingLine?.dequeue()
        timeRequired = timeRequired + 0.7
    }
    
    func finishWork() {
        if waitingLine?.isEmpty() != nil{
            print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfClients)명이며, 총 업무시간은 \(timeRequired)초입니다.")
        }
    }
}
