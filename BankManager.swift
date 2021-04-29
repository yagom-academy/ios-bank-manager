//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 은행원
// 번호표를 확인?
struct BankManager: Hashable { 
  private let counterNumber: Int
  
  init(_ counterNumber: Int) {
    self.counterNumber = counterNumber
  }
  
  func process(bank: Bank) {
    let workingTime = 0.7
    let unit = 1000000.0
    let currentTicket = bank.showCurrentTicket()
    
    print("\(currentTicket)번 고객 업무 시작")
//    bank.startBankWork(counter: counterNumber)
    bank.makeTicketNumberToNext()
    bank.operationQueue.addOperation {
      usleep(UInt32(workingTime * unit))
      
      print("\(currentTicket)번 고객 업무 완료")
      bank.sendOutCustomer(ticket: currentTicket)
      bank.addToTotalCustomer()
//      bank.setBankCounter(number: counterNumber)
    }
  }
}
