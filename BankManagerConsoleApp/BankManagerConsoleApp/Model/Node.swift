//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by Ellen on 2021/07/27.
//

import Foundation

protocol NodeValue { }

class Node {
    
    var value: NodeValue?
    var next: Node?
    
    init(value: NodeValue?, next: Node?) {
        self.value = value
        self.next = next
    }
}
