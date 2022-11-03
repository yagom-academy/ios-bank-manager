//
//  Node.swift
//  BankManagerConsoleApp
//
//  Copyright (c) 2022 Zhilly, Minii All rights reserved.

class Node<T>: Equatable {
    let data: T
    var next: Node?
    
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs === rhs
    }
    
    init(data: T) {
        self.data = data
    }
}
