//
//  NodeType.swift
//  BankManagerConsoleApp
//
//  Created by kyungmin, Max on 2023/07/10.
//

class CustomerNode<Element> {
    var value: Element
    var nextNode: CustomerNode?
    
    init(_ value: Element) {
        self.value = value
    }
    
    func setNextNode(_ nextNode: CustomerNode) {
        self.nextNode = nextNode
    }
}
