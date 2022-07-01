//
//  Worker.swift
//  BankManagerConsoleApp
//
//  Created by 김동용 on 2022/07/01.
//

protocol Worker {
    var totalWorkTime: Double { get set }

    mutating func doWork()
    mutating func startWork()
    mutating func finishWork()
}
