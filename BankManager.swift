//
//  BankManager.swift
//  Created by sunnycookie, inho
//

import Foundation

struct BankManager {
    mutating func startManagement() {
        print(Constant.options, terminator: Constant.empty)
        
        guard let input = readLine() else {
            return
        }
        
        switch input {
        case Constant.optionOne:
            setupBank()
            startManagement()
        case Constant.optionTwo:
            return
        default:
            print(Constant.wrongInputMessage)
            startManagement()
        }
    }
    
    private mutating func receiveCustomer() -> Queue<Customer> {
        var customers: Queue<Customer> = Queue()
        let customerCount = Int.random(in: Constant.customerRange)
        
        for count in 1...customerCount {
            customers.enqueue(Customer.init(waitingNumber: count))
        }
        
        return customers
    }
    
    private mutating func setupBank() {
        let customers = receiveCustomer()
        var bank = Bank(customers: customers)
        bank.openBank()
    }
}

private extension BankManager {
    enum Constant {
        static let options: String = "1 : 은행 개점 \n2 : 종료 \n입력 : "
        static let empty: String = ""
        static let optionOne: String = "1"
        static let optionTwo: String = "2"
        static let wrongInputMessage: String = "다시 입력해주세요"
        static let customerRange: ClosedRange<Int> = 10...30
    }
}

