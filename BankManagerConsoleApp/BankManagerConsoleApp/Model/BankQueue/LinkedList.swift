//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Lingo, Cathy on 2022/04/25.
//

import Foundation

struct LinkedList<T> {
  private var head: Node<T>?
  private var tail: Node<T>?

  var isEmpty: Bool {
    return head == nil
  }

  var first: T? {
    return head?.data
  }

  mutating func append(_ data: T?) {
    let newNode = Node(data)
    if head == nil {
      head = newNode
    } else {
      tail?.setNext(newNode)
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
