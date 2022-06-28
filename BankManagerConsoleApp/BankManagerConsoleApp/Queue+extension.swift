//
//  Queue+extension.swift
//  BankManagerConsoleApp
//
//  Created by finnn, bard on 2022/06/28.
//

extension Queue: CustomStringConvertible, CustomDebugStringConvertible {
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

extension Queue: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: T...) {
        self.init()
        elements.forEach { self.enqueue(data: $0) }
    }
}
