//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by Lingo, Cathy on 2022/04/29.
//

import Foundation

final class BankManager {
  private enum Message {
    static let menu = "1 : 은행개점\n2 : 종료\n입력 : "
    static let whiteSpace = ""
  }

  private enum Menu: String {
    case open = "1"
    case exit = "2"
  }

  func start() {
    while selectMenu() {}
  }

  private func selectMenu() -> Bool {
    displayMenu()
    guard let input = readLine(),
          let menu = Menu(rawValue: input)
    else { return true }

    switch menu {
    case .open:
      Bank().open()
      return true
    case .exit:
      return false
    }
  }

  private func displayMenu() {
    print(Message.menu, terminator: Message.whiteSpace)
  }
}
