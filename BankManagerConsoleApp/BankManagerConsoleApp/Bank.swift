//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 강경 on 2021/04/26.
//

import Foundation

class Bank {
  let operationQueue = OperationQueue()
  private var customers: [Int:Customer] = [:]
  private var bankCounters: [Int:BankManager] = [:]
  private var currentTicketNumber = 1
  private var totalCompletedCustomer = 0
  
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
    let openTime = CFAbsoluteTimeGetCurrent()
    
    var isRepeat = true
    repeat {
      if customers.isEmpty {
        isRepeat = false
      }
      
      if customers[currentTicketNumber] != nil {
        guard let workingCounter = bankCounters.first else {
          operationQueue.waitUntilAllOperationsAreFinished()
          continue
        }
        
        workingCounter.value.process(bank: self)
      } else {
        continue
      }
    } while isRepeat
    
    close(from: openTime)
  }
  
  func close(from openTime: CFAbsoluteTime) {
    let closeTime = CFAbsoluteTimeGetCurrent()

    let complateString = """
    업무가 마감되었습니다.
    오늘 업무를 처리한 고객은 총 \(totalCompletedCustomer)명이며,
    총 업무 시간은 \(closeTime - openTime)초입니다.
    """
    print(complateString)
  }
}

// MARK: - BankManagerProcess
extension Bank {
  func startBankWork(counter: Int) {
    bankCounters[counter] = nil
  }
  
  func sendOutCustomer(ticket customerTicketNumber: Int) {
    customers[customerTicketNumber] = nil
  }
  
  func showCurrentTicket() -> Int {
    return currentTicketNumber
  }
  
  func makeToNextTicket() {
    currentTicketNumber += 1
  }
  
  func setBankCounter(number counterNumber: Int) {
    bankCounters[counterNumber] = BankManager(counterNumber)
  }
  
  func addToTotalCustomer() {
    totalCompletedCustomer += 1
  }
}
