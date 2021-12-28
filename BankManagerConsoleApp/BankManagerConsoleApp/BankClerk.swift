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
    
    private static func setDepartment(count: Int, department: String) -> [DispatchQueue] {
        var clerkQueue: [DispatchQueue] = []
        for number in 1...count {
            let clerk = DispatchQueue(label: "\(department)Clerk\(number)")
            clerkQueue.append(clerk)
        }
        return clerkQueue
    }
    
}
