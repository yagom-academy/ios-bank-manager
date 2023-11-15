//
//  File.swift
//  
//
//  Created by Hisop on 2023/11/15.
//

@testable import BankManager

final class MockLinkedList<T>: LinkedList<T> {
    private(set) var callMethod = false
    
    override var checkEmpty: Bool {
        callMethod = true
        return true
    }
    
    override var elementCount: Int {
        callMethod = true
        return 42
    }
    
    override var headValue: T? {
        callMethod = true
        return nil
    }
    
    override func addNode(value: T) {
        callMethod = true
    }
    
    override func removeNode() -> T? {
        callMethod = true
        return nil
    }
    
    override func removeAll() {
        callMethod = true
    }
}
