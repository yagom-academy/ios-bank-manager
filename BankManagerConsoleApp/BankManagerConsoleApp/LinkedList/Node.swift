//
//  NodeType.swift
//  BankManagerConsoleApp
//
//  Created by kyungmin, Max on 2023/07/10.
//

class Node<Element: Equatable> {
    var element: Element
    var nextNode: Node?
    
    init(_ element: Element) {
        self.element = element
    }
}
