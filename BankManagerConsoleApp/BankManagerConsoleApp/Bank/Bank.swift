//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Kiwi, Kay on 2022/07/01.
//
import Foundation

class Bank {
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
            let random = Int.random(in: 0...1)
            let customer = Customer(customerNumber: element, business: WorkType.allCases[random])
            self.lineOfCustomers.enqueue(data: customer)
        }
    }
    
    func distributeTask () {
    
    }
    
    func openBank() {
        var userInput: String?
        repeat {
            self.inputMenu()
            userInput = readLine()
            if let input = userInput {
                if input == "1" {
                    self.generateRandomNumberOfCustomers()
                    self.insertCustomersIntoQueue()
                    self.distributeTask()
                }
            }
        } while userInput != "2"
    }
}
