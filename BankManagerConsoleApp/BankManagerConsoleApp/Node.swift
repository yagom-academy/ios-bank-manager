//
//  Node.swift
//  Created by sunnycookie, inho
//

import Foundation

final class Node<T> {
    private(set) var data: T
    private(set) var next: Node?
    
    init(data: T) {
        self.data = data
    }
}
