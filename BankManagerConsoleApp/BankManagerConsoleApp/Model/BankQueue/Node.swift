//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by Lingo, Cathy on 2022/04/25.
//

import Foundation

final class Node<T> {
  private(set) var data: T?
  private(set) var next: Node<T>?

  init(_ data: T?, _ next: Node<T>? = nil) {
    self.data = data
    self.next = next
  }

  func setNext(_ next: Node<T>?) {
    self.next = next
  }
}
