//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by Do Yi Lee on 2021/07/27.
//

import Foundation

class Node<Value> {
    //MARK: Properties
    var value: Value
    var next: Node? = nil
    
    init(value: Value) {
        self.value = value
    }
    
    init(value: Value, next: Node?) {
        self.value = value
        self.next = next
    }
}

//MARK:-Node Print Method
extension Node {
    func printNodes() -> String {
        return "\(value) -> \(String(describing: next))"
    }
}
