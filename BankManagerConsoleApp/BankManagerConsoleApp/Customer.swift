//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by 강경 on 2021/04/26.
//

import Foundation

struct Customer: Hashable {
  let orderNumber: Int
  
  init(_ orderNumber: Int) {
    self.orderNumber = orderNumber
  }
}
