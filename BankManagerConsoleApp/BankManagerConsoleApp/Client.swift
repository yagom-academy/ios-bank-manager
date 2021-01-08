//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by Zero DotOne on 2021/01/07.
//

import Foundation

class Client {
    enum Priority {
        case VVIP
        case VIP
        case normal
    }
    
    private(set) var tag: Int
    private(set) var priority: Priority
    
    init(tag: Int, priority: Priority) {
        self.tag = tag
        self.priority = priority
    }
}
