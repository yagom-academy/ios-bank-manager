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
        case BankMenu.open:
            setupBank()
            startManagement()
        case BankMenu.close:
            return
        default:
            print(Constant.wrongInputMessage)
            startManagement()
        }
    }
    
    private mutating func setupBank() {
        var bank = Bank()
        
        addCustomer(to: &bank)
        bank.openBank()
    }
    
    private mutating func addCustomer(to bank: inout Bank) {
        let customerCount = Int.random(in: Constant.customerRange)
        
        for count in 1...customerCount {
            let customer = Customer.init(waitingNumber: count)
            bank.receive(customer: customer)
        }
    }
}

private extension BankManager {
    enum BankMenu {
        static let open: String = "1"
        static let close: String = "2"
    }
    
    enum Constant {
        static let options: String = "1 : 은행 개점 \n2 : 종료 \n입력 : "
        static let empty: String = ""
        static let wrongInputMessage: String = "다시 입력해주세요"
        static let customerRange: ClosedRange<Int> = 10...30
    }
}
