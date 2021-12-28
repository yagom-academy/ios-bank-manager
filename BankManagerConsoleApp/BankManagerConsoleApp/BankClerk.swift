//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by Seul Mac on 2021/12/28.
//

import Foundation

struct BankClerk {
    
    let depositDepartment: [DispatchQueue]
    let loanDepartment: [DispatchQueue]
    private var depositClerkNumber: Int
    private var loanClerkNumber: Int
    
    init(depositClerkCount: Int, loanClerkCount: Int) {
        self.depositDepartment = BankClerk.setDepartment(count: depositClerkCount, department: "deposit")
        self.loanDepartment = BankClerk.setDepartment(count: loanClerkCount, department: "loan")
        self.depositClerkNumber = 0
        self.loanClerkNumber = 0
    }
    
    private static func setDepartment(count: Int, department: String) -> [DispatchQueue] {
        var clerkQueue: [DispatchQueue] = []
        for number in 1...count {
            let clerk = DispatchQueue(label: "\(department)Clerk\(number)")
            clerkQueue.append(clerk)
        }
        return clerkQueue
    }
    
    mutating func assignClerk(of department: BankService) -> DispatchQueue {
        switch department {
        case .deposit:
            let clerk = depositDepartment[depositClerkNumber]
            depositClerkNumber = (depositClerkNumber + 1) % depositDepartment.count
            return clerk
        case .loan:
            let clerk = loanDepartment[loanClerkNumber]
            loanClerkNumber = (loanClerkNumber + 1) % loanDepartment.count
            return clerk
        }
    }
    
}
