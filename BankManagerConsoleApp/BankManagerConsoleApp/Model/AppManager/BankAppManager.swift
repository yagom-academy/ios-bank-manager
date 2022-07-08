//
//  BankAppManager.swift
//  BankManagerConsoleApp
//
//  Created by minsson, Derrick kim on 2022/07/01.
//

struct BankAppManager {
    private var bank = Bank()
    private let clientGenerator = ClientQueueGenerator()
    
    private func setUpMenuList() {
        print("1: 은행 개점")
        print("2: 종료")
        print("입력 : ", terminator: "")
    }
    
    mutating func run() {
        setUpMenuList()
        guard let selectedNumber = readLine(),
              let system = BankSystem(rawValue: selectedNumber) else {
            print("\n입력이 잘못되었습니다. 다시 입력해주세요.")
            run()
            return
        }
        
        switch system {
        case .on:
            let clients = clientGenerator.generate()
      
            bank.open(clients: clients)
            bank.close()
            run()
        case .off:
            break
        }
    }
}
