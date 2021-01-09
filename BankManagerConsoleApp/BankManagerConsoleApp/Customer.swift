//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by 김태형 on 2021/01/09.
//

import Foundation

struct Customer {
    let waitingNumber: Int
    let customerClass: CustomerClass
    
    enum CustomerClass: Int, CaseIterable {
        case VVIP = 0
        case VIP = 1
        case normal = 2
        
        var description: String {
            switch self {
            case .VVIP:
                return "VVIP 고객"
            case .VIP:
                return "VIP 고객"
            case .normal:
                return "일반 고객"
            }
        }
    }
    
    init(waitingNumber: Int, customerClass: CustomerClass) {
        self.waitingNumber = waitingNumber
        self.customerClass = customerClass
    }
    
    static func setCustomerClass() -> Int {
        let customerClass = Int.random(in: 0...2)
      return customerClass
    }
    
    func setCustomerClassMessage(customerClass: CustomerClass) -> String {
        switch customerClass {
        case .VVIP:
            return CustomerClass.VVIP.description
        case .VIP:
            return CustomerClass.VIP.description
        case .normal:
            return CustomerClass.normal.description
        }
    }
}

