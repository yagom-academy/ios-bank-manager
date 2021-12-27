//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 서녕 on 2021/12/23.
//

import Foundation

struct Banker {
  let assignedTask: BankingType
  private let task: DispatchWorkItem
  
  init(assignedTask: BankingType) {
    self.assignedTask = assignedTask
    task = DispatchWorkItem {
      Thread.sleep(forTimeInterval: assignedTask.requiredTime)
    }
  }
  
  func doTask(client: Client) {
    let clientNumber = client.sequence + 1
    guard let requiredBankingType = client.requiredBankingType?.rawValue else {
      return
    }
    
    print("\(clientNumber)번 고객 \(requiredBankingType)업무 시작")
    DispatchQueue.global().sync(execute: task)
    print("\(clientNumber)번 고객 \(requiredBankingType)업무 완료")
  }
}
