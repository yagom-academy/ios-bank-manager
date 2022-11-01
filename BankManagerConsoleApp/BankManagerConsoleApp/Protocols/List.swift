//
//  List.swift
//  BankManagerConsoleApp
//
//  Created by Gundy, jpush on 2022/11/01.
//

protocol List {
    associatedtype Item
    
    mutating func pushLast(_ element: Item)
    mutating func popFirst() -> Node<Item>?
    mutating func clear()
    func peek() -> Node<Item>?
    func isEmpty() -> Bool
}
