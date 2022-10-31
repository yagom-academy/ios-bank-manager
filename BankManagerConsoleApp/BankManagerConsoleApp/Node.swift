//  BankManagerConsoleApp - Node.swift
//  Created by Ayaan/Dragon/som on 2022/10/31.
//  Copyright © yagom academy. All rights reserved.

import Foundation

class Node<T> {
    var nextNode: Node?
    let value: T
    
    init(nextNode: Node? = nil, value: T) {
        self.nextNode = nextNode
        self.value = value
    }
}
