//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by ehd on 2021/08/02.
//

import Foundation

class Bank {
    
    private let depositBankTeller = BankTeller()
    private let loanBankTeller = BankTeller()
    private var waitingLine = Queue<Client>()
    
    static let minimumClients: UInt = 3
    static let maximumClients: UInt = 5
    private var numberOfClients = UInt.random(in: minimumClients...maximumClients)
    
    func openBank() {
        let group = DispatchGroup()
        let time: CFTimeInterval = CFAbsoluteTimeGetCurrent()
        arrangeClients()
        startWork(group: group)
        group.wait()
        finishWork(startTime: time)
    }
    
    private func arrangeClients() {
        (1...numberOfClients).forEach {
            var client = Client(waitingNumber: $0)
            determineWork(client: &client)
            waitingLine.enqueue(data: client)
        }
    }
    
    private func determineWork(client: inout Client) {
        let kindOfWork = UInt.random(in: 1...2)
        switch kindOfWork {
        case 1:
            client.work = BusinessCategory.deposit
        case 2:
            client.work = BusinessCategory.loan
        default:
            return
        }
    }
    
    private func startWork(group: DispatchGroup) {
        DispatchQueue.global().async(group: group) {
            self.bankTellerWork(bankTeller: self.depositBankTeller)
        }
        DispatchQueue.global().async(group: group) {
            self.bankTellerWork(bankTeller: self.depositBankTeller)
        }
        DispatchQueue.global().async(group: group) {
            self.bankTellerWork(bankTeller: self.loanBankTeller)
        }
    }
    
    func bankTellerWork(bankTeller: BankTeller) {
        while self.waitingLine.isEmpty() == false {
            guard let client = self.waitingLine.dequeue()?.data,
                  let work = client.work else {
                return
            }
            bankTeller.receive(clientNumber: client.waitingNumber, work: work)
        }
    }
    
    private func finishWork(startTime: CFTimeInterval) {
        let finishTime = CFAbsoluteTimeGetCurrent()
            print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(numberOfClients)명이며, 총 업무시간은 \(String(format: "%.2f",finishTime - startTime))초입니다.")
    }
}
