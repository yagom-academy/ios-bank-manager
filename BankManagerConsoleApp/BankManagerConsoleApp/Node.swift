//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by vetto, kokkilE on 2023/03/06.
//

final class Node<T> {
    let data: T
    var next: Node?
    
    init(_ data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}
