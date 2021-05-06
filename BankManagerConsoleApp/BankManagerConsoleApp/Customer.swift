//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by 이성노 on 2021/05/05.
//

import Foundation

var customerQueue: [Customer] = []

struct Customer {
    var waitingNumber: Int
    var grade: String
    var visitPurpose: String
    
    init(waitingNumber: Int, grade: String, visitPurpose: String) {
        self.waitingNumber = waitingNumber
        self.grade = grade
        self.visitPurpose = visitPurpose
    }
    
    func createCustomers(numberOfCustomers: Int) -> [Customer] {
        for customerNumber in 1...numberOfCustomers {
            let waitingNumber = customerNumber
            let grade = checkCustomerPriority(grade: Int.random(in: 1...3))
            let visitPurpose = assignTask(visitPurpose: Int.random(in: 1...2))
            let customer = Customer(waitingNumber: waitingNumber, grade: grade, visitPurpose: visitPurpose)
            customerQueue.append(customer)
        }
        return customerQueue
    }
}

func checkCustomerPriority(grade: Int) -> String {
    switch grade {
    case 1:
        return "VVIP"
    case 2:
        return "VIP"
    default:
        return "normal"
    }
}


func assignTask(visitPurpose: Int) -> String {
    switch visitPurpose {
    case 1:
        return "예금"
    case 2:
        return "대출"
    default:
        return "해당사항 없음"
    }
}
