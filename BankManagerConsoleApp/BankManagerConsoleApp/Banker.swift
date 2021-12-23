//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 서녕 on 2021/12/23.
//

import Foundation

struct Banker() {
  func doTask(clientSequence: Int) {
    print("\(clientSequence)번 고객 업무 시작")
    DispatchQueue.global().sync {
      sleep(0.7)
    }
    print("\(clientSequence)번 고객 업무 완료")
  }
}
