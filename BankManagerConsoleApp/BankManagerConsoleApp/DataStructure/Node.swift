//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by 레옹아범, 혜모리 on 2023/03/06.
//

final class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T) {
        self.value = value
    }
}
