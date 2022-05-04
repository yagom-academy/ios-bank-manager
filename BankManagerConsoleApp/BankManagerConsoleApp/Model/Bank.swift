//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Taeangel, Tiana 2022/04/26.
//

final class Bank {
    private(set) var clerks: [BankClerk] = []
    var clients: Queue<Client>
    
    init(clients: Queue<Client>) {
        self.clients = clients
    }
    
    private func configureClerks() {
        let clerk = BankClerk()
        clerks.append(clerk)
    }
    
    func open() {
        configureClerks()
    }
    
    func close(totalDuration: Double, clientCount: Int) {
        print("""
              업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(clientCount)명이며, \
              총 업무시간은 \(totalDuration.formatSecondDecimal)초입니다.
              """)
    }
}
