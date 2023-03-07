//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by vetto, kokkilE on 2023/03/07.
//

struct BankManager {
    let bank = Bank()
    var customerQueue = Queue<BankCustomer>()
    
    func printBankMenu() {
        print("1 : 은행 개점")
        print("2 : 종료")
        print("입력 : ")
    }
    
    func receiveUserInput() -> String? {
        let userInput = readLine()
        
        return userInput
    }
    
}
