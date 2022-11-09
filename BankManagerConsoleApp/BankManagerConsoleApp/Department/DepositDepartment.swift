//
//  DepositDepartment.swift
//  BankManagerConsoleApp

import Foundation

struct DepositDepartment: Departmentable {
    let bankService: BankService = .deposit
    let numberOfClerks: Int
    let customerQueue: DispatchQueue = DispatchQueue(label: "deposit", attributes: .concurrent)
    let queueSemaphore: DispatchSemaphore
    
    init(numberOfClerks: Int) {
        self.numberOfClerks = numberOfClerks
        self.queueSemaphore = DispatchSemaphore(value: numberOfClerks)
    }
}
