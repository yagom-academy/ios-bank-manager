//
//  BankNode.swift
//  
//
//  Created by Gray, Gama on 3/18/24.
//

public class BankNode<T> {
    public var data: T
    public var next: BankNode?
    
    public init(data: T, next: BankNode? = nil) {
        self.data = data
        self.next = next
    }
}
