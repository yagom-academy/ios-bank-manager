//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 레옹아범, 혜모리 on 2023/03/07.
//

struct Bank {
    private var customers: Queue<Customer> = Queue()
    
    func printMenu() {
        print("1 : 은행개점\n2 : 종료")
        
        guard let input = readLine() else {
            return
        }
        
        switch input {
        case "1":
            return
        case "2":
            return
        default:
            return
        }
    }
    
    mutating func receive() {
        let customerCount = Int.random(in: 10...30)
        
        for count in 1...customerCount {
            customers.enqueue(Customer(number: count))
        }
    }
}
