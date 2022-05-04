//
//  BankLoanTask.swift
//  BankManagerConsoleApp
//
//  Created by Lingo on 2022/05/04.
//

import Foundation

struct BankLoanTask: BankTaskType {
  private enum Constants {
    static let time = 1.1
    static let start = "%d번 고객 대출업무 시작"
    static let finished = "%d번 고객 대출업무 완료"
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
