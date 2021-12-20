//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 서녕 on 2021/12/20.
//

import Foundation

class Node<Element> {
    let value: Element
    var next: Node?
    
    init(value: Element, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}
