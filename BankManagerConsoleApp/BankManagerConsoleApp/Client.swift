//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by mmim, malrang.
//

import Foundation

struct Client {
    private(set) var orderNumber: Int
    
    init(_ orderNumber: Int) {
        self.orderNumber = orderNumber
    }
}
