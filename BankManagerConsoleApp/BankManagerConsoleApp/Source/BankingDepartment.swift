//
//  BankingDepartment.swift
//  BankManagerConsoleApp
//
//  Created by JINHONG AN on 2021/08/05.
//

import Foundation

struct BankingDepartment {
    let duty: BankingCategory
    var queue = Queue<Customer>()
    let semaphore: DispatchSemaphore
    
    init(duty: BankingCategory, numberOfBankTellers: Int) {
        self.duty = duty
        semaphore = DispatchSemaphore(value: numberOfBankTellers)
    }
}
