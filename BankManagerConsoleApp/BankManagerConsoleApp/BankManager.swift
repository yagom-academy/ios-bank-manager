//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by Mangdi, Mene on 2022/11/02.
//

import Foundation

struct BankManager {
    var numberOfCustomer: Int = Int.random(in: 10...30)
    var customerQueue: CustomerQueue<Customer>
    
    mutating func openUp() {
        selectMenu()
    }
    
    private mutating func selectMenu() {
        print("""
              1 : 은행개점
              2 : 종료
              입력 :
              """, terminator: " ")
        guard let userInput = readLine()?.replacingOccurrences(of: " ", with: "") else { return }
        
        switch userInput {
        case "1":
            addCustomer()
        case "2":
            break
        default:
            print("입력이 잘못되었습니다. \n")
            selectMenu()
        }
    }
    
    private mutating func addCustomer() {
        for number in 1...numberOfCustomer {
            let customer: Customer = Customer(waitingNumber: number)
            customerQueue.enqueue(data: customer)
        }
    }
}
