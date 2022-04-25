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
    if self.head == nil {
      self.head = newNode
    } else {
      self.tail?.next = newNode
    }
    self.tail = newNode
  }
}
