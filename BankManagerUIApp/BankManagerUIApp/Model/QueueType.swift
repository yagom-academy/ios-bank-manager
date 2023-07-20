//
//  QueueType.swift
//  BankManagerUIApp
//
//  Created by kyungmin, Max on 2023/07/20.
//

protocol QueueType {
    associatedtype Element: Equatable
    
    var isEmpty: Bool { get }
    
    mutating func enqueue(_ value: Element)
    mutating func dequeue() -> Element?
    mutating func clear()
    func peek() -> Element?
}


