//
//  Queuable.swift
//  BankManagerConsoleApp
//
//  Created by mint, Jusbug on 2023/07/13.
//

protocol Queueable {
    associatedtype T

    var isEmpty: Bool { get }
    
    func peek() -> T?

    mutating func enqueue(_ element: T)

    mutating func dequeue() -> T?

    mutating func clear()
}
