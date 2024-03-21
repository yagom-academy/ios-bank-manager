//
//  BankNode.swift
//  
//
//  Created by Gray, Gama on 3/18/24.
//

class BankNode<T> {
    var data: T
    var next: BankNode?
    
    init(data: T, next: BankNode? = nil) {
        self.data = data
        self.next = next
    }
}
