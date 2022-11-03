//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Aaron, tottale on 11/3/22.
//

struct Bank {
    let clerk = BankClerk()
    let customerQueue = Queue<Customer>()
    
    func open() {
        Array(repeating: 0, count: Int.random(in: 10...30)).enumerated().forEach { index, number in
            customerQueue.enqueue(Customer(number: index+1))
        }
    }
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
