//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by Kobe, Hemg on 2023/07/10.
//

final class Node<T> {
    var value: T
    var next: Node<T>?
    
    init(value: T) {
        self.value = value
    }
}
