//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Erick, Serena on 2023/07/12.
//

public struct Customer {
    public let waitingNumber: Int
    public let workType: WorkType? = WorkType.allCases.randomElement()
    
    public init(waitingNumber: Int) {
        self.waitingNumber = waitingNumber
    }
}
