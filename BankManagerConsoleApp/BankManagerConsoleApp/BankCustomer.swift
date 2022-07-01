//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by finnn, bard on 2022/07/01.
//

struct BankCustomer: Customer {
    var id: Int
    
    static func generateRandomCustomer(of range: ClosedRange<Int> = NameSpace.randomCustomerNumberRange) -> Queue<BankCustomer> {
        let randomNumber = Int.random(in: range)
        
        var randomCustomerQueue = Queue<BankCustomer>()
        
        for index in 1...randomNumber {
            randomCustomerQueue.enqueue(data: BankCustomer(id: index))
        }
        
        return randomCustomerQueue
    }
}
