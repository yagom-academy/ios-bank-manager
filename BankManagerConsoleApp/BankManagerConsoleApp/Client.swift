//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by Zero DotOne on 2021/01/07.
//

import Foundation

class Client {
    enum Priority: Comparable, CaseIterable {
        case normal
        case VIP
        case VVIP
        
        var string: String {
            switch self {
            case .normal:
                return "일반"
            case .VIP:
                return "VIP"
            case .VVIP:
                return "VVIP"
            }
        }
    }
    
    private(set) var tag: Int
    private(set) var priority: Priority
    private(set) var business: BankBusiness
    
    init(tag: Int) {
        self.tag = tag
        self.priority = Priority.allCases.randomElement() ?? .normal
        self.business = BankBusiness.allCases.randomElement() ?? .deposit
    }
    
    init(tag: Int, priority: Priority, bankBusiness: BankBusiness) {
        self.tag = tag
        self.priority = priority
        self.business = bankBusiness
    }
}

extension Client: Comparable {
    static func < (lhs: Client, rhs: Client) -> Bool {
        return lhs.priority < rhs.priority
    }
    
    static func == (lhs: Client, rhs: Client) -> Bool {
        return lhs.priority == rhs.priority
    }
}
