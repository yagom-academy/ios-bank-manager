//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by karen on 2023/07/11.
//

final class Node<Element> {
    var value: Element
    var next: Node?
    
    init(value: Element) {
        self.value = value
    }
}
