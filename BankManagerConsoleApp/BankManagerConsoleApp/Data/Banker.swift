//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by Wonhee on 2021/01/04.
//

import Foundation

class Banker {
    private var processedCustomerNumber: Int = 0
    private var customer: Customer?
    
    private let startTaskMessgae = "%d번 %@고객 %@업무 시작"
    private let endTaskMessgae = "%d번 %@고객 %@업무 완료"
    
    func increaseCustomerNumber() {
        processedCustomerNumber += 1
    }
    
    func setCustomer(_ customer: Customer) {
        self.customer = customer
    }
}
