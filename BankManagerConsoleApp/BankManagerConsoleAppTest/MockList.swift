//
//  MockList.swift
//  BankManagerConsoleApp
//
//  Created by Donnie, Safari on 2022/04/25.
//

import Foundation
@testable import BankManagerConsoleApp

final class MockList<T>: Listable {
    var mockData: [T] = []
    var isEmpty: Bool {
        return mockData.isEmpty
    }
    var peek: T? {
        return mockData.first
    }
    
    func append(_ data: T) {
        mockData.append(data)
    }
    
    func removeFirst() -> T? {
        return mockData.remove(at: 0)
    }
    
    func removeAll() {
        mockData.removeAll()
    }
}
