//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager: Hashable { 
  private let counterNumber: Int
  
  init(_ counterNumber: Int) {
    self.counterNumber = counterNumber
  }
  
  func process(bank: Bank) {
    let workingTime = 0.7
    let currentTicket = bank.showCurrentTicket()
    
    print("\(currentTicket)번 고객 업무 시작")
    bank.startBankWork(counter: counterNumber)
    bank.operationQueue.addOperation {
      let unit = 1000000.0
      usleep(UInt32(workingTime * unit))
      
      print("\(currentTicket)번 고객 업무 완료")
      bank.sendOutCustomer(ticket: currentTicket)
      bank.addToTotalCustomer()
      bank.addToTotalTime(as: workingTime)
      bank.setBankCounter(number: counterNumber)
      bank.makeToNextTicket()
    }
  }
}
