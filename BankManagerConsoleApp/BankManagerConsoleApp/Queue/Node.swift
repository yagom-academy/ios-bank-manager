//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by minsson, Derrick on 2022/06/27.
//

final class Node<T> {
    var data: T
    var nextNode: Node?
    
    init(_ data: T) {
        self.data = data
    }
}
