//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 강경 on 2021/04/26.
//

import Foundation

class Bank {
  var customers = Set<Customer>()
  var bankManagers = Set<BankManager>()
  
  init(numOfManagers: Int) {
    let randomNumber = Int.random(in: 10...30)
    for orderNumber in 1...randomNumber {
      customers.insert(Customer(orderNumber))
    }
    
    for counterNumber in 1...numOfManagers {
      bankManagers.insert(BankManager(counterNumber))
    }
  }
  
  func open() {
    
  }
  
  func close() {
    
  }
}
