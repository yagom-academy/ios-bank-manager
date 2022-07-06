//
//  Workable.swift
//  BankManagerConsoleApp
//
//  Created by finnn, bard on 2022/07/01.
//

protocol Workable {
    associatedtype customer: Customer
    var workTime: Double { get set }
    var task: Task? { get set }

    mutating func startWork(of customer: customer)
    mutating func finishWork(of customer: customer)
}
