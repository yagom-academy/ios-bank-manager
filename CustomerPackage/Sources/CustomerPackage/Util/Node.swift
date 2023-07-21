//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by Erick, Serena on 2023/07/10.
//

public final class Node<Element> {
    public var value: Element
    public var next: Node?
    
    public init(value: Element) {
        self.value = value
    }
}
