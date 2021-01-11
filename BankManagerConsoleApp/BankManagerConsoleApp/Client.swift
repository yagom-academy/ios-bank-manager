//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by 임리나 on 2021/01/05.
//

import Foundation

struct Clients {
    var list: [Client] = []
    
    init(count: Int) {
        for waitingNumber in 1...count {
            guard let businessType = BusinessType.allCases.randomElement(), let priority = Client.Priority.allCases.randomElement() else {
                return
            }
            list.append(Client(waitingNumber: waitingNumber, businessType: businessType, priority: priority))
        }
    }
}

struct Client {
    enum Priority: Comparable, CaseIterable {
        case VVIP
        case VIP
        case normal
        
        var description: String {
            switch self {
            case .VVIP:
                return "VVIP"
            case .VIP:
                return "VIP"
            case .normal:
                return "일반"
            }
        }
    }
    
    let waitingNumber: Int
    let businessType: BusinessType
    let priority: Priority
    
    init(waitingNumber: Int, businessType: BusinessType = .deposit, priority: Priority = .normal) {
        self.waitingNumber = waitingNumber
        self.businessType = businessType
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
