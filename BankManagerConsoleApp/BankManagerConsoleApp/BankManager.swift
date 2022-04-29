//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by Lingo on 2022/04/29.
//

import Foundation

final class BankManager {
  func start() {
    print("""
    1 : 은행개점
    2 : 종료
    입력 :
    """, terminator: "")

    guard let input = readLine() else { return }
    switch input {
    case "1":
      Bank().open()
    case "2":
      return
    default:
      break
    }
    return start()
  }
}
