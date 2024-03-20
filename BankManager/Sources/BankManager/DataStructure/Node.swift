//
//  Node.swift
//
//
//  Created by Diana, Hamzzi on 3/18/24.
//

class Node<Element> {
    var value: Element
    var next: Node?
    
    init(value: Element) {
        self.value = value
    }
}
