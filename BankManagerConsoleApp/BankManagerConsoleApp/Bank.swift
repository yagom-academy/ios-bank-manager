//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Aaron, tottale on 11/3/22.
//

struct Bank {
    
    struct BankClerk {}
    let clerk = BankClerk()
    
    func open() {}
    
    func close() {}
    
    func menu() {
        print("1: 은행 개점")
        print("2: 종료")
        let menuNumber = readLine()
        switch menuNumber {
        case "1":
            open()
        case "2":
            close()
        default:
            menu()
        }
    }
}
