//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by Zero DotOne on 2021/01/07.
//

import Foundation

class Client {
    enum Priority: Comparable {
        case normal
        case VIP
        case VVIP
    }
    
    private(set) var tag: Int
    private(set) var priority: Priority
    
    init(tag: Int, priority: Priority) {
        self.tag = tag
        self.priority = priority
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
