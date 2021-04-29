//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by 강경 on 2021/04/26.
//

import Foundation

struct Customer: Hashable {
  private let ticketNumber: Int
  
  init(order orderNumber: Int) {
    self.ticketNumber = orderNumber
  }
  
  func showTicketNumber() -> Int {
    return ticketNumber
  }
}
