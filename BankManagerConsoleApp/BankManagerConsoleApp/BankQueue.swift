//
//  BankQueue.swift
//  BankManagerConsoleApp
//
//  Created by 고명주 on 2022/04/25.
//

import Foundation

struct BankQueue<T> {
  private var list = BankList<T>()

  var isEmpty: Bool {
    return list.isEmpty
  }

  mutating func enqueue(_ data: T?) {
    list.append(data)
  }

  mutating func dequeue() -> T? {
    return list.removeFirst()
  }

  mutating func clear() {
    list.clear()
  }
}
