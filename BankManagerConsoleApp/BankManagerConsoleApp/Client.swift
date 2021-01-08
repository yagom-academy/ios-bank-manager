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
    
    init(tag: Int, priority: Priority = .normal, business: BankBusiness = .loan) {
        self.tag = tag
        
        if let randomPriority = Priority.allCases.randomElement() {
            self.priority = randomPriority
        } else {
            self.priority = priority
        }
        
        if let randomBusiness = BankBusiness.allCases.randomElement() {
            self.business = randomBusiness
        } else {
            self.business = business
        }
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
