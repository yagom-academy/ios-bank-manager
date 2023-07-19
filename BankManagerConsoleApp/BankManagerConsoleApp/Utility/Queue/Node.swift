//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by Dasan & Mary on 2023/07/10.
//

final class Node<T> {
    var element: T
    var next: Node?
    
    init(element: T) {
        self.element = element
    }
}
