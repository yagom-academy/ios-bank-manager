//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 서녕 on 2021/12/23.
//

import Foundation

struct Banker {
  private let task = DispatchWorkItem {
    Thread.sleep(forTimeInterval: 0.7)
  }
  
  func doTask(client: Client) {
    print("\(client.sequence)번 고객 업무 시작")
    DispatchQueue.global().sync(execute: task)
    print("\(client.sequence)번 고객 업무 완료")
  }
}
