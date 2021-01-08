//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by Kyungmin Lee on 2021/01/04.
//

import Foundation

struct Queue<T: Comparable> {
    private var data = [T]()
    private let ordered: (T, T) -> Bool
    
    init(ascending: Bool = false, startingValues: [T] = []) {
        if ascending {
            ordered = { $0 > $1 }
        } else {
            ordered = { $0 < $1 }
        }
        
        data = startingValues
        var index = data.count / 2 - 1
        while index >= 0 {
            sink(1)
            index -= 1
        }
    }
    
    var count: Int {
        return data.count
    }
    
    var isEmpty: Bool {
        return data.isEmpty
    }
    
    mutating func enqueue(element: T) {
        data.append(element)
        swim(data.count - 1)
    }
    
    mutating func dequeue() -> T? {
        if data.isEmpty {
            return nil
        }
        if data.count == 1 {
            return data.removeFirst()
        }
        data.swapAt(0, data.count - 1)
        let temp = data.removeLast()
        sink(0)
        return temp
    }
    
    private mutating func sink(_ index: Int) {
        var index = index
        while 2 * index + 1 < data.count {
            var secondIndex = 2 * index + 1
            if secondIndex < (data.count - 1) && ordered(data[secondIndex], data[secondIndex + 1]) {
                secondIndex += 1
            }
            if !ordered(data[index], data[secondIndex]) {
                break
            }
            data.swapAt(index, secondIndex)
            index = secondIndex
        }
    }
    
    private mutating func swim(_ index: Int) {
        var index = index
        while index > 0 && ordered(data[(index - 1) / 2], data[index]) {
            data.swapAt((index - 1) / 2, index)
            index = (index - 1) / 2
        }
    }
}
