//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by 임리나 on 2021/01/05.
//

import Foundation

final class Client {
    enum Priority: Int, CaseIterable {
        case first = 0
        case second
        case third
        
        var description: String {
            switch self {
            case .first:
                return "VVIP"
            case .second:
                return "VIP"
            case .third:
                return "일반"
            }
        }
    }
    
    let waitingNumber: Int
    let businessType: BusinessType
    let priority: Priority
    
    init(waitingNumber: Int, businessType: BusinessType = .deposit, priority: Priority = .third) {
        self.waitingNumber = waitingNumber
        self.businessType = businessType
        self.priority = priority
    }
}
