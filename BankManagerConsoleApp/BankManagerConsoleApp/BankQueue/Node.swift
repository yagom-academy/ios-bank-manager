//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by Lingo, Cathy on 2022/04/25.
//

import Foundation

final class Node<T> {
  var data: T?
  var next: Node<T>?

  init(_ data: T?) {
    self.data = data
  }
}
