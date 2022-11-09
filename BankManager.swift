//
//  BankManager.swift
//  Created by sunnycookie, inho
//

import Foundation

struct BankManager {
    var bank: Bank
    
    mutating func startManagement() {
        print(Constant.options, terminator: Constant.empty)
        
        guard let input = readLine() else { return }
        
        switch input {
        case BankMenu.open:
            addCustomer()
            bank.runBankingCycle()
            startManagement()
        case BankMenu.close:
            return
        default:
            print(Constant.wrongInputMessage)
            startManagement()
        }
    }
    
    private mutating func addCustomer() {
        let customerCount = Constant.randomCustomerCount
        
        for count in 1...customerCount {
            guard let bankingType = BankingType.allCases.randomElement() else { return }
            
            let customer = Customer.init(waitingNumber: count, bankingType: bankingType)
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
        static let randomCustomerCount: Int = Int.random(in: 10...30)
    }
}
