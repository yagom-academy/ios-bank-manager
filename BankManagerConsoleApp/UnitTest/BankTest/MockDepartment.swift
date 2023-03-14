//
//  MockDepartment.swift
//  BankTest
//
//  Created by Rowan, 릴라 on 2023/03/14.
//

import Foundation

class MockDepartment: Respondable {
    var respondCustomer: Customer?
    
    func respond(to customer: Customer, workGroup: DispatchGroup) {
        respondCustomer = customer
    }
}
