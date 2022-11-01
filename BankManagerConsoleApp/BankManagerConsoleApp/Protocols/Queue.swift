//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by Gundy, jpush on 2022/11/01.
//

protocol Queue {
    associatedtype DataType
    
    mutating func enqueue(_ element: DataType)
    mutating func dequeue() -> DataType?
    mutating func clear()
    func peek() -> DataType?
    func isEmpty() -> Bool
}
