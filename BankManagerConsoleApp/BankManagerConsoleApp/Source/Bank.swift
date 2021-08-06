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
    private let departmentGroup = DispatchGroup()
    private var elapsedTime = 0.0
    
    init(departmentInformation: [(departmentCategory: BankingCategory, numberOfDepartmentTellers: Int)]) {
        departmentInformation.forEach { category, numberOfTellers in
            self.departments[category] = BankingDepartment(duty: category, numberOfBankTellers: numberOfTellers, departmentGroup: self.departmentGroup)
        }
    }
    
    func close() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalNumberOfVisitors)명이며, 총 업무시간은 \(String(format: "%.2f", elapsedTime))초입니다.")
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
        let startTime = Date()
        departments.forEach { _, bankingDepartment in
            departmentGroup.enter()
            DispatchQueue.global().async {
                bankingDepartment.serveCustomers()
            }
        }
        departmentGroup.wait()
        elapsedTime = Date().timeIntervalSince(startTime)
    }
}
