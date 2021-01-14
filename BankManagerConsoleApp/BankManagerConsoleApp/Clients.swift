//
//  Clients.swift
//  BankManagerConsoleApp
//
//  Created by 리나 on 2021/01/12.
//

import Foundation

struct Clients {
    var list: [Client] = []
    
    init(count: Int) {
        for waitingNumber in 1...count {
            guard let businessType = BusinessType.allCases.randomElement(), let priority = Client.Priority.allCases.randomElement() else {
                return
            }
            let clinet = Client(waitingNumber: waitingNumber, businessType: businessType, priority: priority)
            list.append(clinet)
        }
    }
}
