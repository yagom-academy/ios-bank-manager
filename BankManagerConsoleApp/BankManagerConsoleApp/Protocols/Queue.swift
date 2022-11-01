//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by Gundy, jpush on 2022/11/01.
//

protocol Queue {
    var head: Node<Queueable>? { get set }
    var tail: Node<Queueable>? { get set }
    
    mutating func enqueue(_ element: Queueable)
    mutating func dequeue() -> Queueable?
    mutating func clear()
    func peek() -> Queueable?
    func isEmpty() -> Bool
}
