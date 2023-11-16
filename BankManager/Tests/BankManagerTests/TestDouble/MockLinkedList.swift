//
//  File.swift
//  
//
//  Created by Hisop on 2023/11/15.
//

@testable import BankManager

final class MockLinkedList<T>: LinkedList<T> {
    private(set) var callMethodCount = 0
        
    override var checkEmpty: Bool {
        callMethodCount += 1
        
        return true
    }
    
    override var elementCount: Int {
        callMethodCount += 1
        
        return 42
    }
    
    override var headValue: T? {
        callMethodCount += 1
        
        return nil
    }
    
    override func addNode(value: T) {
        callMethodCount += 1
    }
    
    override func removeNode() -> T? {
        callMethodCount += 1
        
        return nil
    }
    
    override func removeAll() {
        callMethodCount += 1
    }
}
