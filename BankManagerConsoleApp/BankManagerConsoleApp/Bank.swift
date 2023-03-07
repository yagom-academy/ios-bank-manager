//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 레옹아범, 혜모리 on 2023/03/07.
//

struct Bank {
    private var customers: Queue<Customer> = Queue()
    private var manager: BankManager = BankManager()
    
    mutating func printMenu() {
        print("1 : 은행개점\n2 : 종료")
        
        guard let input = readLine() else {
            return
        }
        
        switch input {
        case "1":
            run()
        case "2":
            return
        default:
            printMenu()
        }
    }
    
    mutating func receive() -> Int {
        let customerCount = Int.random(in: 10...30)
        
        for count in 1...customerCount {
            customers.enqueue(Customer(number: count))
        }
        
        return customerCount
    }
    
    mutating func doWork(customer: Customer) {
        manager.customer = customer
        
        manager.aaa()
    }
    
    mutating func run() {
        let customerCount = receive()
        let totalWorkTime = Double(customerCount) * 0.7
        
        while customers.isEmpty == false {
            guard let customer = customers.dequeue() else {
                break
            }
            
            doWork(customer: customer)
        }
        
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(customerCount)명이며, 총 업무시간은 \(totalWorkTime)초입니다.")
        printMenu()
    }
}
