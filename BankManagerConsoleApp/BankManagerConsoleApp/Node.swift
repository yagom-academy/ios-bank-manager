//
//  NodeType.swift
//  BankManagerConsoleApp
//
//  Created by kyungmin, Max on 2023/07/10.
//

class Node<Element> {
    var value: Element
    var nextNode: Node?
    
    init(_ value: Element) {
        self.value = value
    }
}
