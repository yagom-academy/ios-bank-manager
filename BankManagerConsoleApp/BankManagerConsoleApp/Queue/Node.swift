//
//  Node.swift
//  Created by Rhode, sehong.
//  Copyright © yagom academy. All rights reserved.
//

final class Node<T> {
    var data: T
    var next: Node<T>?
    
    init(data: T, next: Node<T>? = nil) {
        self.data = data
        self.next = next
    }
}
