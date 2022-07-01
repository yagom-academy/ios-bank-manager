//
//  Worker.swift
//  BankManagerConsoleApp
//
//  Created by finnn, bard on 2022/07/01.
//

protocol Worker {
    var totalWorkTime: Double { get set }

    mutating func startWork(of customer: BankCustomer)
    mutating func finishWork(of customer: BankCustomer)
}
