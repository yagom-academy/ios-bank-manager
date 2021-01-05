//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    var bank = Bank()
    
    mutating func openBank(bankClerkNumber: Int) {
        // 0이나 음수가 들어오면?
        for i in 1...bankClerkNumber {
            bank.serviceCounter[i] = BankClerk()
        }
        
        visitClients(newClientsNumber: Int.random(in: 10...30))
    }
    
    func closeBank() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(bank.totalProcessedClientsNumber)명이며, 총 업무시간은 \(bank.totalOperatingTime)초입니다.")
    }
    
    mutating func visitClients(newClientsNumber: Int) {
        // 0이나 음수가 들어오면?
        bank.totalVistedClientsNumber += newClientsNumber
        
        for _ in 1...newClientsNumber {
            bank.totalVistedClientsNumber += 1
            
            let client = Client(waitingNumber: bank.totalVistedClientsNumber, business: .basic)
            
            bank.waitingList.append(client)
        }
    }
    
    mutating func assignCounter() {
        // bank.serviceCounter을 조회하다가 isWorking이 false이면 ClientList의 맨앞을 제거하고 업무를 처리하게끔 한다.
//        for bankClerk in bank.serviceCounter.values {
//
//            if bankClerk.isWorking == false {
//                guard let current = bank.waitingList.first else { return }
//                bank.waitingList.removeFirst()
//
//                bankClerk.handleClientBusiness(client: current)
//            }
//        }
    }
}

