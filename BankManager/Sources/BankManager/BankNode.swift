//
//  File.swift
//  
//
//  Created by H on 3/18/24.
//

import Foundation

class BankNode<T> {
    var data: T
    var next: BankNode?
    
    init(data: T, next: BankNode? = nil) {
        self.data = data
        self.next = next
    }
}
