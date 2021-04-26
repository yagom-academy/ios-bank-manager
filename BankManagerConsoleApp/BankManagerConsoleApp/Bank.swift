//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 강경 on 2021/04/26.
//

import Foundation

class Bank {
  var customers = Set<Customer>()
  let bankManagers: Set<BankManager>
  
  init(bankManagers: Set<BankManager>) {
    self.bankManagers = bankManagers
  }
  
  func initCustomers() {
    let randomNumber = Int.random(in: 10...30)
    for orderNumber in 1...randomNumber {
      customers.insert(Customer(orderNumber))
    }
  }
  
  func open() {
    
  }
  
  func close() {
    
  }
}
