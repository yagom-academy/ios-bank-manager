//
//  DoubleStack.swift
//  BankManagerConsoleApp
//
//  Created by OneTool, Red on 2022/04/26.
//

final class DoubleStack<T>: Listable {
    private var dequeueStack: [T] = []
    private var enqueueStack: [T] = []

    var count: Int {
        return enqueueStack.count + dequeueStack.count
    }

    var isEmpty: Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }

    var first: T? {
        return dequeueStack.isEmpty ? enqueueStack.first : dequeueStack.last
    }

    var last: T? {
        return enqueueStack.isEmpty ? dequeueStack.first : enqueueStack.last
    }

    func append(value: T) {
        enqueueStack.append(value)
    }

    func removeAll() {
        enqueueStack.removeAll()
        dequeueStack.removeAll()
    }

    func removeFirst() -> T? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }
}
