//
//  BankLoanTask.swift
//  BankManagerConsoleApp
//
//  Created by Lingo, Cathy on 2022/05/04.
//

import Foundation

final class BankLoanTask: BankTaskType {
  private enum Constants {
    static let time = 1.1
    static let taskName = "대출"
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
      self.logger.log(.taskFinish(number: clientNumber, taskName: Constants.taskName))
    }
    RunLoop.current.run()
  }
}
