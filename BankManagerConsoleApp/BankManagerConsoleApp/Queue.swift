//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 이영우 on 2021/05/04.
//
//

import Foundation

struct Queue<T> {
  private var array = [T]()
  var isEmpty: Bool {
    return array.isEmpty
  }
  
  var count: Int {
    return array.count
  }
  
  mutating func enqueue(_ element: T) {
    array.append(element)
  }
  
  mutating func dequeue() -> T? {
    if isEmpty {
      return nil
    } else {
      return array.removeFirst()
    }
  }
  
  var front: T? {
    return array.first
  }
}

extension Queue {
  func filter(check: (T)->Bool) -> Queue<T> {
    var result = Queue<T>()
    for element in array {
      if check(element) {
        result.enqueue(element)
      }
    }
    return result
  }
}
