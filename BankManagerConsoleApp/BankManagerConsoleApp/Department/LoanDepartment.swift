//
//  LoanDepartment.swift
//  BankManagerConsoleApp

import Foundation

struct LoanDepartment: Departmentable {
    let bankService: BankService = .loan
    let numberOfClerks: Int
    let customerQueue: DispatchQueue = DispatchQueue(label: "loan", attributes: .concurrent)
    let queueSemaphore: DispatchSemaphore
    
    init(numberOfClerks: Int) {
        self.numberOfClerks = numberOfClerks
        self.queueSemaphore = DispatchSemaphore(value: numberOfClerks)
    }
}
