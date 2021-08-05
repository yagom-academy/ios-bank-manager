//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by JINHONG AN on 2021/07/30.
//

import Foundation

class Bank {
    private var totalNumberOfVisitors: UInt = .zero
    private var departments = [BankingCategory:BankingDepartment]()
    private let dispatchGroup = DispatchGroup()
    
    init(departmentInformation: (departmentCategory: BankingCategory, numberOfDepartmentTellers: Int)...) {
        departmentInformation.forEach { category, numberOfTellers in
            self.departments[category] = BankingDepartment(duty: category, numberOfBankTellers: numberOfTellers, taskGroup: self.dispatchGroup)
        }
    }
    
    func close() {
        totalNumberOfVisitors = .zero
    }
    
    func takeNumberTicket() -> UInt {
        totalNumberOfVisitors += 1
        return totalNumberOfVisitors
    }
    
    func receive(customers: [Customer]) {
        customers.forEach { currentCustomer in
            let desiredDepartment = departments[currentCustomer.desiredTask]
            desiredDepartment?.receive(customer: currentCustomer)
        }
    }
    
    func serveCustomers() {
        departments.forEach { _, bankingDepartment in
            bankingDepartment.serveCustomers()
        }
    }
}
