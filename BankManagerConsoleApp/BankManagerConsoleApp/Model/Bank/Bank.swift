//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by minsson, Derrick kim on 2022/07/01.
//

import Foundation

final class Bank {
    private var bankManager = BankManager()
    
    private let depositManagerNumber = 2
    private let loanManagerNumber = 1
    
    private var depositClientQueue = ClientQueue<Client>()
    private var loanClientQueue = ClientQueue<Client>()
    
    private var totalProcessingTime: Double = 0.0
    
    private let bankManagersGroup = DispatchGroup()
}

private extension Bank {
    func fetchClients(_ clients: (deposit: ClientQueue<Client>, loan: ClientQueue<Client>)) {
        depositClientQueue = clients.deposit
        loanClientQueue = clients.loan
    }
    
    func arrange(bankManagers number: Int, to queue: ClientQueue<Client>) {
        for _ in 1...number {
            DispatchQueue.global().async(group: bankManagersGroup) {
                self.bankManager.assignTask(to: queue)
            }
        }
    }
    
    func reportSummary(elapsedTime: CFAbsoluteTime) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(bankManager.retrieveTotalVisitedClients())명이며, 총 업무시간은 \(elapsedTime.roundDown())초입니다.")
    }
}

extension Bank {
    func open(clients: (ClientQueue<Client>, ClientQueue<Client>)) {
        fetchClients(clients)

        let startTime = CFAbsoluteTimeGetCurrent()
        
        DispatchQueue.global().sync {
            arrange(bankManagers: depositManagerNumber, to: depositClientQueue)
            arrange(bankManagers: loanManagerNumber, to: loanClientQueue)
            
            bankManagersGroup.wait()
        }
        
        let closeTime = CFAbsoluteTimeGetCurrent()
        let elapsedTime = closeTime - startTime
        reportSummary(elapsedTime: elapsedTime)
    }
    
    func close() {
        totalProcessingTime = 0.0
        bankManager.clearTotalVisitedClientsRecord()
    }
}
