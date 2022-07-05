//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by finnn, bard on 2022/06/27.
//

final class Node<T> {
    var next: Node<T>?
    weak var previous: Node<T>?
    var data: T
    
    init(data: T) {
        self.data = data
    }
}
