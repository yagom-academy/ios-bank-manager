//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by Erick, Serena on 2023/07/10.
//

final class Node<Element> {
    var value: Element
    var next: Node?
    
    init(value: Element) {
        self.value = value
    }
}
