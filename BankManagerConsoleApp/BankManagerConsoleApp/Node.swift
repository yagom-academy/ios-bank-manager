//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by finnn, bard on 2022/06/27.
//

class Node<T> {
    var next: Node<T>?
    var previous: Node<T>?
    var data: T
    
    init(data: T) {
        self.data = data
    }
}
