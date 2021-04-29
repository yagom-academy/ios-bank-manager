//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 은행원
// 현재 번호를 확인하고, 해당 고객 인스턴스를 호출한다
// currentCustomer
struct Banker: Hashable { 
  private let counterNumber: Int
  
  init(_ counterNumber: Int) {
    self.counterNumber = counterNumber
  }
  
  func process(_ customer: Customer) {
    let workingTime = 0.7
    let unit = 1000000.0
    let currentTicket = customer.showTicketNumber()
    
    print("\(currentTicket)번 고객 업무 시작")
    usleep(UInt32(workingTime * unit))
    print("\(currentTicket)번 고객 업무 완료")
  }
}
