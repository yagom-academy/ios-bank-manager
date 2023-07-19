//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Erick, Serena on 2023/07/12.
//

struct Customer {
    let waitingNumber: Int
    let workType: WorkType? = WorkType.allCases.randomElement()
}
