//
//  BankAppManager.swift
//  BankManagerConsoleApp
//
//  Created by minsson, Derrick kim on 2022/07/01.
//

import Foundation

struct BankAppManager {
    private var bank = Bank()
    private let clientGenerator = ClientGenerator()
    
    mutating func run() {
        setUpMenuList()
        guard let selectedNumber = readLine(),
              let system = BankSystem(rawValue: selectedNumber) else {
            run()
            return
        }
        
        switch system {
        case .on:
            let clients = clientGenerator.generateClients()
      
            bank.open(clients: clients)
            bank.close()
            run()
        case .off:
            break
        }
    }
    
    private func setUpMenuList() {
        print("1: 은행 개점")
        print("2: 종료")
        print("입력 : ", terminator: "")
    }
}
