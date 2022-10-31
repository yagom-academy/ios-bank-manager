//  Node.swift
//  BankManagerConsoleApp
//  Created by jeremy, LJ on 2022/10/31.

final class Node<T> {
    let data: T
    var next: Node?
    
    init(data: T) {
        self.data = data
    }
}
