//
//  WaitingLineNode.swift
//  BankManagerConsoleApp
//
//  Created by Erick, Serena on 2023/07/10.
//

final class WaitingLineNode<Element> {
    var value: Element
    var next: WaitingLineNode?
    
    init(value: Element, next: WaitingLineNode? = nil) {
        self.value = value
    }
}
