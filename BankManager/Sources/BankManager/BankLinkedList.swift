//
//  File.swift
//  
//
//  Created by JIWOONG on 2024/03/18.
//

import Foundation

struct BankLinkedList<T> {
    var head: BankNode<T>?
    var tail: BankNode<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
}
