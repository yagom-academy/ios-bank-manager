//
//  Listable.swift
//  BankManagerConsoleApp
//
//  Created by mmim, malrang.
//

import Foundation
 
protocol Listable {
    associatedtype Element
    
    var count: Int { get }
    var isEmpty: Bool { get }
    var first: Element? { get }
    
    mutating func append(value: Element)
    mutating func removeFirst() -> Element?
    mutating func removeAll()
}
