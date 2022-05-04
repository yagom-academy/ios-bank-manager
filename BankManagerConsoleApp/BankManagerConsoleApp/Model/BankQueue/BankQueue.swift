//
//  BankQueue.swift
//  BankManagerConsoleApp
//
//  Created by Lingo, Cathy on 2022/04/25.
//

import Foundation

struct BankQueue<T> {
  private var list = LinkedList<T>()
  private(set) var count: Int = .zero
  private let limit: Int

  var isFull: Bool {
    return limit == count
  }

  var isEmpty: Bool {
    return list.isEmpty
  }

  var peek: T? {
    return list.first
  }

  init(limit: Int) {
    self.limit = limit
  }

  mutating func enqueue(_ data: T?) {
    guard !isFull else { return }
    count += 1
    list.append(data)
  }

  mutating func dequeue() -> T? {
    if count > Int.zero { count -= 1 }
    return list.removeFirst()
  }

  mutating func clear() {
    list.clear()
  }
}
