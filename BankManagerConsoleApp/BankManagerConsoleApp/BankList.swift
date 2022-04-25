//
//  BankList.swift
//  BankManagerConsoleApp
//
//  Created by 고명주 on 2022/04/25.
//

import Foundation

struct BankList<T> {
  private var head: BankNode<T>?
  private var tail: BankNode<T>?
  var isEmpty: Bool {
    head == nil
  }

  mutating func append(_ data: T?) {
    let newNode = BankNode(data)
    if head == nil {
      head = newNode
    } else {
      tail?.next = newNode
    }
    tail = newNode
  }

  mutating func removeFirst() -> T? {
    if isEmpty {
      return nil
    } else if head?.next == nil {
      let headNode = head
      clear()
      return headNode?.data
    } else {
      let headNode = head
      head = head?.next
      return headNode?.data
    }
  }
  
  mutating func clear() {
    head = nil
    tail = nil
  }
}
