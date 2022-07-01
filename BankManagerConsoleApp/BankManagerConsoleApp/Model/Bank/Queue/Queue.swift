//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by minsson, Derrick on 2022/06/27.
//

protocol Queue {
    associatedtype Element
    
    var peek: Element? { get }
    
    mutating func enqueue(_ data: Element)
    func isEmpty() -> Bool
    func clear()
}
