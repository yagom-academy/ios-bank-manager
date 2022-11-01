//  BankManagerConsoleApp - Node.swift
//  Created by Ayaan/Dragon/som on 2022/10/31.
//  Copyright © yagom academy. All rights reserved.

import Foundation

class Node<T> {
    var nextNode: Node?
    weak var previousNode: Node?
    let data: T
    
    init(nextNode: Node? = nil, previousNode: Node? = nil, data: T) {
        self.nextNode = nextNode
        self.previousNode = previousNode
        self.data = data
    }
}
