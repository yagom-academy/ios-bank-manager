//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by Kobe, Hemg on 2023/07/10.
//

final class Node<Type> {
    var value: Type
    var next: Node<Type>?
    
    init(value: Type) {
        self.value = value
    }
}
