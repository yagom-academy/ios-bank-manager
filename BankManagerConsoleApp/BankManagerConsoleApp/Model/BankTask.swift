//
//  BankTask.swift
//  BankManagerConsoleApp
//
//  Created by Lingo on 2022/05/06.
//

import Foundation

final class BankTask {
  private var taskName: String
  private var taskTime: Double
  private(set) var semaphore: DispatchSemaphore

  init(name: String, time: Double, numberOfClerk: Int) {
    semaphore = DispatchSemaphore(value: numberOfClerk)
    taskName = name
    taskTime = time
  }

  func execute(_ client: Client) {
    let clientNumber = client.waitingNumber
    Logger.shared.log(.taskStart(number: clientNumber, taskName: taskName))
    Timer.scheduledTimer(withTimeInterval: taskTime, repeats: false) { _ in
      Logger.shared.log(.taskFinish(number: clientNumber, taskName: self.taskName))
    }
    RunLoop.current.run()
  }
}
