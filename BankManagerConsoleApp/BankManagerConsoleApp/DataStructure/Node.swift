//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by mmim, malrang.
//

import Foundation

final class Node<Element> {
    var value: Element
    weak var previous: Node?
    var next: Node?
    
    init(value: Element) {
        self.value = value
    }
}
