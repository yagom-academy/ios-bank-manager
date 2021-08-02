//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by 홍정아 on 2021/08/02.
//

import Foundation

class Node<T> {
    var data: T!
    var next: Node<T>?
    
    init(with data: T) {
        self.data = data
    }
    
    private init() {
        self.data = nil
    }
    
    fileprivate static func obtainDummyNode() -> Node<T> {
        return Node<T>()
    }
}
