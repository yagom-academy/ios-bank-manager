//
//  QueueType.swift
//  BankManagerConsoleApp
//
//  Created by kyungmin, Max on 2023/07/10.
//

protocol QueueType {
    associatedtype Element
    
    mutating func enqueue(_ value: Element)
    mutating func dequeue() -> Element?
    mutating func clear()
    func peek() -> Element?
    func isEmpty() -> Bool
}

