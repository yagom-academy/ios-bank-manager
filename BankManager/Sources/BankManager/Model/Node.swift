//
//  Node.swift
//  BankManagerUIApp
//
//  Created by Kiseok on 11/13/23.
//

public final class Node<T> {
    public private(set) var data: T
    public var next: Node?
    
    public init(data: T) {
        self.data = data
    }
}
