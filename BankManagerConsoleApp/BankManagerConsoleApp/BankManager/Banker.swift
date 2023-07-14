//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Kobe, Hemg on 2023/07/14.
//

struct Banker {
    private var numberOfBankers: Int
    
    init(numberOfBankers: Int) {
        self.numberOfBankers = numberOfBankers
    }
    
    func processBankerTask(customer: Customer) {
        print("\(customer.user)번 고객 업무 완료")
    }
}
