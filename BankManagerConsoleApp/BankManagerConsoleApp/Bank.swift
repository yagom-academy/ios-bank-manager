//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 강경 on 2021/04/26.
//

import Foundation

class Bank {
  private let operationQueue = OperationQueue()
  private var customers: [Int:Customer] = [:]
  private var bankCounters: [Int:BankManager] = [:]
  private var currentTicketNumber = 1
  private var totalCompletedCustomer = 0
  private var totalWorkedTime = 0.0
  
  init(numOfManagers: Int) {
    let randomNumber = Int.random(in: 10...30)
    for ticketNumber in 1...randomNumber {
      customers[ticketNumber] = Customer(order: ticketNumber)
    }
    
    for counterNumber in 1...numOfManagers {
      bankCounters[counterNumber] = BankManager(counterNumber)
    }
  }
  
  func open() {
    var isRepeat = true
    repeat {
      if customers.isEmpty {
        isRepeat = false
      }
      
      if let _ = customers[currentTicketNumber] {
        guard let workingCounter = bankCounters.first else {
          operationQueue.waitUntilAllOperationsAreFinished()
          continue
        }
        
        work(order: currentTicketNumber, counter: workingCounter)
      } else {
        continue
      }
    } while isRepeat
    
    close()
  }
  
  private func work(order: Int, counter: Dictionary<Int, BankManager>.Element) {
    let workingTime = 0.7
    
    print("\(order)번 고객 업무 시작")
    self.bankCounters[counter.key] = nil
    
    operationQueue.addOperation {
      let unit = 1000000.0
      usleep(UInt32(workingTime * unit))
      
      print("\(order)번 고객 업무 완료")
      self.totalWorkedTime += workingTime
      self.customers[self.currentTicketNumber] = nil
      self.currentTicketNumber += 1
      self.bankCounters[counter.key] = counter.value
      self.totalCompletedCustomer += 1
    }
  }
  
  func close() {
    let complateString = """
    업무가 마감되었습니다.
    오늘 업무를 처리한 고객은 총 \(totalCompletedCustomer)명이며,
    총 업무 시간은 \(totalWorkedTime)초입니다.
    """
    print(complateString)
  }
}
