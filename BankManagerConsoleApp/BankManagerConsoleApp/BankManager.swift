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
    static let depositNumberOfClerk = 2
    static let depositTaskTime = 0.7
    static let depositTaskName = "예금"
    static let loanNumberOfClerk = 1
    static let loanTaskTime = 1.1
    static let loanTaskName = "대출"
  }

  private enum Menu: String {
    case open = "1"
    case exit = "2"
  }

  func start() {
    while true {
      Logger.shared.log(.menu, terminator: Constants.whiteSpace)

      guard let input = readLine(),
            let menu = Menu(rawValue: input) else { continue }

      switch menu {
      case .open:
        let totalClerk = Constants.depositNumberOfClerk + Constants.loanNumberOfClerk
        let bank = Bank(maxClient: Constants.limit, totalClerkCount: totalClerk)
        let clients = createClients()
        bank.addClients(clients)
        bank.open()
      case .exit:
        return
      }
    }
  }

  private func createClients() -> [Client] {
    let tasks = [
      BankTask(
        name: Constants.depositTaskName,
        time: Constants.depositTaskTime,
        numberOfClerk: Constants.depositNumberOfClerk
      ),
      BankTask(
        name: Constants.loanTaskName,
        time: Constants.loanTaskTime,
        numberOfClerk: Constants.loanNumberOfClerk
      )
    ]
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
