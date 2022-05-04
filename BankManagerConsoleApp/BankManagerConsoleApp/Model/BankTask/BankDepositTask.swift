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
    static let taskName = "예금"
  }

  private(set) var semaphore: DispatchSemaphore
  private let logger = Logger()

  init(_ numberOfClerk: Int) {
    semaphore = DispatchSemaphore(value: numberOfClerk)
  }

  func execute(_ client: Client) {
    let clientNumber = client.waitingNumber
    logger.log(.taskStart(number: clientNumber, taskName: Constants.taskName))
    Timer.scheduledTimer(withTimeInterval: Constants.time, repeats: false) { _ in
      logger.log(.taskFinish(number: clientNumber, taskName: Constants.taskName))
    }
    RunLoop.current.run()
  }
}
