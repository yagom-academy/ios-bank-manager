//
//  Department.swift
//  BankManagerConsoleApp
//
//  Created by Luyan, Marco on 2021/08/04.
//

import Foundation

class Department {
    let bankingTask: BankingTask
    let dispatchQueue: DispatchQueue
    let dispatchSemaphore: DispatchSemaphore
    private var bankTellers: Array<BankTeller>
    
    init(bankingTask: BankingTask) {
        self.bankingTask = bankingTask
        self.bankTellers = .init(repeating: BankTeller(bankingTask: bankingTask), count: bankingTask.numberOfBankWindow)
        self.dispatchQueue = .init(label: "Department.\(bankingTask)", attributes: .concurrent)
        self.dispatchSemaphore = .init(value: bankingTask.numberOfBankWindow)
    }
    
    func assignBankTeller() -> BankTeller? {
        return bankTellers.popLast()
    }
    
    func setup(_ bankTeller: BankTeller) {
        bankTellers.append(bankTeller)
    }
}
