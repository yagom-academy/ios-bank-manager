//
//  BankNode.swift
//  BankManagerConsoleApp
//
//  Created by Lingo, Cathy on 2022/04/25.
//

import Foundation

final class BankNode<T> {
  var data: T?
  var next: BankNode<T>?

  init(_ data: T?) {
    self.data = data
  }
}
