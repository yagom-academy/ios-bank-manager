//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by 1 on 2021/12/20.
//

import Foundation

class Node<Element> {
    var data: Element?
    var next: Node?
    
    init(data: Element?, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}
