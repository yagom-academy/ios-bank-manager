//
//  BankDepositTask.swift
//  BankManagerConsoleApp
//
//  Created by Lingo, Cathy on 2022/04/29.
//

import Foundation

struct BankDepositTask: BankTaskType {
  private enum Constants {
    static let time = 0.7
    static let start = "%d번 고객 예금업무 시작"
    static let finished = "%d번 고객 예금업무 완료"
  }

  private(set) var semaphore: DispatchSemaphore

  init(_ numberOfClerk: Int) {
    semaphore = DispatchSemaphore(value: numberOfClerk)
  }

  func execute(_ client: Client) {
    let clientNumber = client.waitingNumber
    let time = Constants.time

    print(String(format: Constants.start, clientNumber))
    Thread.sleep(forTimeInterval: time)
    print(String(format: Constants.finished, clientNumber))
  }
}
