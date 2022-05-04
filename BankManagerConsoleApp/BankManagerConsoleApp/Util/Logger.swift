//
//  Logger.swift
//  BankManagerConsoleApp
//
//  Created by Lingo, Cathy on 2022/05/04.
//

import Foundation

final class Logger {
  private enum Constants {
    static let taskStart = "%d번 고객 %@업무 시작"
    static let taskFinish = "%d번 고객 %@업무 완료"
    static let closed = "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 %d명이며, 총 업무시간은 %.2f초입니다."
    static let menu = "1 : 은행개점\n2 : 종료\n입력 : "
  }

  func log(_ messageType: MessageType) {
    print(messageType.description)
  }

  func log(_ messageType: MessageType, terminator: String) {
    print(messageType.description, terminator: terminator)
  }
}

extension Logger {
  enum MessageType {
    case taskStart(number: Int, taskName: String)
    case taskFinish(number: Int, taskName: String)
    case closed(count: Int, time: Double)
    case menu

    var description: String {
      switch self {
      case let .taskStart(number, taskName):
        return String(format: Constants.taskStart, number, taskName)
      case let .taskFinish(number, taskName):
        return String(format: Constants.taskFinish, number, taskName)
      case let .closed(totalClientCount, totalExecuteTime):
        return String(format: Constants.closed, totalClientCount, totalExecuteTime)
      case .menu:
        return Constants.menu
      }
    }
  }
}
