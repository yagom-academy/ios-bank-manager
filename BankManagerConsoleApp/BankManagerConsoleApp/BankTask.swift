//
//  BankTask.swift
//  BankManagerConsoleApp
//
//  Created by Lingo, Cathy on 2022/04/29.
//

import Foundation

struct BankTask {
  func execute(_ client: Client) -> Double {
    let clientNumber = client.waitingNumber
    let time = 0.7

    print("\(clientNumber)번 고객 업무 시작")
    Thread.sleep(forTimeInterval: time)
    print("\(clientNumber)번 고객 업무 완료")
    return time
  }
}
