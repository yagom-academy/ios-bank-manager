//
//  QueueType.swift
//  BankManagerConsoleApp
//
//  Created by kyungmin, Max on 2023/07/10.
//

protocol QueueType {
    associatedtype Element
    
    var headNode: CustomerNode<Element> { get }
    var tailNode: CustomerNode<Element> { get }
    
    func enqueue(_ value: Element)
    func dequeue() -> Element
    func clear()
    func peek() -> Element
    func isEmpty() -> Bool
}

