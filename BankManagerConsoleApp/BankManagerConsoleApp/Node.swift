//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by 예톤, 웡빙 on 2022/06/27.
//

import Foundation

class Node<T> {
    var next: Node<T>?
    var data: T
    
    init(_ data: T) {
        self.data = data
        self.next = nil
    }
}
