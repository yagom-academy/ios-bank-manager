//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by idinaloq, EtialMoon on 2023/07/13.
//

struct Bank {
    private let bankManager: BankManager = BankManager()
    
    private var singleLinkedList: SingleLinkedList<Customer> = SingleLinkedList<Customer>()
    
    mutating func start() {
        inputMenu()
        createCustomer()
        bankManager.업무처리()
    }
    
    func inputMenu() {
        print("1 : 은행개점\n2 : 종료\n입력 : ", terminator: "")
        let input = readLine()
        print("\(input)입력됨")
    }
    
    mutating func createCustomer() {
        let customerNumber: Int = Int.random(in: 10...30)
        
        for _ in 1...customerNumber {
            let customer: Customer = Customer()
            singleLinkedList.enqueue(customer)
        }
    }
}
