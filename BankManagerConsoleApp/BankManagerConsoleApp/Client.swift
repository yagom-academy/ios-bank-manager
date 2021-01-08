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
    }
    
    enum Business: CaseIterable {
        case loan
        case deposit
    }
    
    private(set) var tag: Int
    private(set) var priority: Priority
    private(set) var business: Business
    
    init(tag: Int, priority: Priority = .normal, business: Business = .loan) {
        self.tag = tag
        
        if let randomPriority = Priority.allCases.randomElement() {
            self.priority = randomPriority
        } else {
            self.priority = priority
        }
        
        if let randomBusiness = Business.allCases.randomElement() {
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
