//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by mmim, malrang.
//

import Foundation

struct Client {
    private(set) var orderNumber: Int
    private(set) var requirementType: WorkType?
    
    init(_ orderNumber: Int) {
        self.orderNumber = orderNumber
        self.requirementType = WorkType.allCases.randomElement()
    }
}
