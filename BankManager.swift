//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct BankManager {
    //var bank: Bank
    
    func openBank() {
        
    }
    
    func closeBank() {
        
    }
    
    func visitClients(clientsNumber: Int) {
        
    }
    
    func printMenu() {
        
    }

    func selectMenu() -> Int {
        print(" 1 : 은행개점 \n 2 : 종료\n 입력 :", terminator: " ")
        
        if let menuNumber = Int(readLine() ?? "") {
            return menuNumber
        }
        
        return 0
    }
}

