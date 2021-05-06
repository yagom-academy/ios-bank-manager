//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Banker: Hashable { 
  private let counterNumber: Int
  
  init(_ counterNumber: Int) {
    self.counterNumber = counterNumber
  }
  
  func process(_ customer: Customer) {
    let workingTime: Double = customer.showTask().taskTime
    let unit = 1000000.0
    let currentTicket = customer.showTicketNumber()
    
    print("\(currentTicket)번 \(customer.showGrade())고객 \(customer.showTask())업무 시작")
    usleep(UInt32(workingTime * unit))
    print("\(currentTicket)번 \(customer.showGrade())고객 \(customer.showTask())업무 완료")
  }
  
  func showCounterNumber() -> Int {
    return counterNumber
  }
}
