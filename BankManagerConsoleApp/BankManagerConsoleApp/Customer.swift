//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by 김태형 on 2021/01/09.
//

import Foundation

struct Customer {
    enum CustomerClass: Int {
        case VVIP = 0
        case VIP = 1
        case normal = 2
    }
    
    enum CustomerClassMessage: String {
        case VVIP = "VVIP 고객"
        case VIP = "VIP 고객"
        case normal = "일반 고객"
    }
    
    func setCustomerClass() -> Int {
        let customerClass = Int.random(in: 0...2)
      return customerClass
    }
    
    func setCustomerClassMessage(customerClass: Int) -> String {
        switch customerClass {
        case CustomerClass.VVIP.rawValue:
            return CustomerClassMessage.VVIP.rawValue
        case CustomerClass.VIP.rawValue:
            return CustomerClassMessage.VIP.rawValue
        default:
            return CustomerClassMessage.normal.rawValue
        }
    }
}

