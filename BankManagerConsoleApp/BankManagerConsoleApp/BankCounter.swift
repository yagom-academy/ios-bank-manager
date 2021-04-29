//
//  BankCounter.swift
//  BankManagerConsoleApp
//
//  Created by 강경 on 2021/04/29.
//

import Foundation

class BankCounter {
  private var counters: [Int:BankManager] = [:]

  func setBankCounters(number: Int) {
    counters[number] = BankManager(number)
  }
  
  func isAvailable() -> Bool {
    if counters.isEmpty {
      return false
    } else {
      return true
    }
  }
  
  func process(_ currentCustomer: Customer) {
    // 현재 번호를 확인하고, 해당 고객 인스턴스를 호출한다
    // currentCustomer
    
    
  }
  
  func startBankWork(counter: Int) {
    counters[counter] = nil
  }
}
