//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 애쉬, 로빈 on 2022/11/03.
//

import Foundation

struct Bank {
    private var bankManager: BankManager
    
    init(bankManager: BankManager) {
        self.bankManager = bankManager
    }
    
    mutating private func generateClient() {
        let randomNumber = Int.random(in: ClientNumber.min...ClientNumber.max)
        for number in 1...randomNumber {
            let randomWork = BankWork.allCases.randomElement() ?? .deposit
            let client = Client(ticketNumber: number, requestWork: randomWork)
            self.bankManager.addClientQueue(client)
        }
    }
    
    mutating func openSystem() {
        while true {
            print("""
                1. 은행개점
                2. 종료
                입력 :
                """, terminator: " ")
            
            guard let selection = readLine(),
                  let menu = MenuOption(rawValue: selection) else {
                print("올바른 메뉴 번호를 입력해주세요.")
                continue
            }
            
            switch menu {
            case .open:
//                let group = DispatchGroup()
//                
//                group.enter()
//                DispatchQueue.global().sync {
//                    generateClient()
//                    self.bankManager.open()
//                    
//                }
//                group.leave()
//                group.wait()
//                self.bankManager.close()
            case .exit:
                exit(0)
            }
        }
    }
}
