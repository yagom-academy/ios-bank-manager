//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by brody, christy, harry on 2023/03/06.
//

final class Node<T> {
    var next: Node<T>?
    let value: T
    
    init(next: Node<T>? = nil, value: T) {
        self.next = next
        self.value = value
    }
}
