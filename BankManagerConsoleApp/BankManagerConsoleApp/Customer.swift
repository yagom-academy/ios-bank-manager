//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by 강경 on 2021/04/26.
//

import Foundation

class Customer: Equatable {
  static func == (lhs: Customer, rhs: Customer) -> Bool {
    if lhs.orderNumber == rhs.orderNumber {
      return true
    } else {
      return false
    }
  }
  
  private let orderNumber: Int
  
  init(order orderNumber: Int) {
    self.orderNumber = orderNumber
  }
}
