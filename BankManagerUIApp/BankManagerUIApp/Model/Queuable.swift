//
//  Queuable.swift
//  BankManagerUIApp
//
//  Created by 박종화 on 2023/07/12.
//

import Foundation

protocol Queueable {
    associatedtype T

    var isEmpty: Bool { get }

    mutating func enqueue(_ element: T)

    mutating func dequeue() -> T?

    mutating func clearQueue()
}

