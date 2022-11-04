//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by Gundy, jpush on 2022/11/01.
//

protocol Queue {
    associatedtype Item
    
    mutating func enqueue(_ element: Item)
    mutating func dequeue() -> Item?
    mutating func clear()
    func peek() -> Item?
    func isEmpty() -> Bool
}
