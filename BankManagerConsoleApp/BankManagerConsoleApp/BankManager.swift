//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by Lingo, Cathy on 2022/04/29.
//

import Foundation

final class BankManager {
  private enum Constants {
    static let limit = 31
    static let range = 10...30
    static let whiteSpace = ""
  }

  private enum Menu: String {
    case open = "1"
    case exit = "2"
  }

  private let logger = Logger()

  func start() {
    while selectMenu() {}
  }

  private func selectMenu() -> Bool {
    logger.log(.menu, terminator: Constants.whiteSpace)

    guard let input = readLine(),
          let menu = Menu(rawValue: input) else { return true }

    switch menu {
    case .open:
      let bank = Bank(maxClient: Constants.limit)
      let clients = createClients()
      bank.addClients(clients)
      bank.open()
      return true
    case .exit:
      return false
    }
  }

  private func createClients() -> [Client] {
    let tasks: [BankTaskType] = [BankDepositTask(2), BankLoanTask(1)]
    var clients = [Client]()
    for number in 1...Int.random(in: Constants.range) {
      if let task = tasks.randomElement() {
        let client = Client(waitingNumber: number, taskType: task)
        clients.append(client)
      }
    }
    return clients
  }
}
