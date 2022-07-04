//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Kiwi, Kay on 2022/07/01.
//
import Foundation

class Bank {
    var bankManagers: Array<BankManager> = []
    var lineOfCustomers = BankManagerQueue<Customer>()
    var numberOfCustomers: Int = 0
    
    func inputMenu() {
        print("1 : 은행 개점")
        print("2 : 종료")
        print("입력 : ", terminator: "")
    }
    
    func generateRandomNumberOfCustomers() {
        numberOfCustomers = Int.random(in: 10...30)
    }
    
    func insertCustomersIntoQueue() {
        for element in 1...self.numberOfCustomers {
            let customer = Customer(customerNumber: element)
            self.lineOfCustomers.enqueue(data: customer)
        }
    }
}
