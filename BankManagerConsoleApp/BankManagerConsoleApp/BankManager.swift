//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by Lingo on 2022/04/29.
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
    print(Message.menu, terminator: Message.whiteSpace)

    guard let input = readLine(),
          let menu = Menu(rawValue: input)
    else { return start() }
    switch menu {
    case .open:
      Bank().open()
      return start()
    case .exit:
      return
    }
  }
}
