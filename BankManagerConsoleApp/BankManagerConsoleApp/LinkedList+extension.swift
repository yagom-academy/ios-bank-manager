//
//  LinkedList+extension.swift
//  BankManagerConsoleApp
//
//  Created by finnn, bard on 2022/06/28.
//

extension LinkedList: Sequence, IteratorProtocol {
    mutating func next() -> T? {
        defer { currentNode = currentNode?.next }
        
        return currentNode?.data
    }
}

extension LinkedList: CustomStringConvertible, CustomDebugStringConvertible {
    var description: String {
        let stringArray = self.map { "\($0)" }
        let returnArrray = stringArray.joined(separator: ", ")
        return "[\(returnArrray)]"
    }
    
    var debugDescription: String {
        let stringArray = self.map { "\($0)" }
        let returnArrray = stringArray.joined(separator: ", ")
        return "[\(returnArrray)]"
    }
}

extension LinkedList: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: T...) {
        self.init()
        elements.forEach { self.add(node: Node<T>(data: $0)) }
    }
}
