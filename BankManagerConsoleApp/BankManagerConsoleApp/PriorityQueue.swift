//
//  PriorityQueue.swift
//  BankManagerConsoleApp
//
//  Created by 김지혜 on 2021/01/12.
//

import Foundation

public protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

struct Heap<Element> {
    var elements: [Element]
    let sort: (Element, Element) -> Bool
    
    init(elements: [Element], sort: @escaping (Element, Element) -> Bool) {
        self.elements = elements
        self.sort = sort
    }
    
    var isEmpty: Bool {
        elements.isEmpty
    }
    
    var count: Int {
        elements.count
    }
    
    func peek() -> Element? {
        elements.first
    }
    
    func leftChildIndex(ofParentAt index: Int) -> Int {
        ( 2 * index ) + 1
    }
    
    func rightChildIndex(ofParentAt index: Int) -> Int {
        ( 2 * index ) + 2
    }
    
    func parentIndex(ofChildAt index: Int) -> Int {
        ( index - 1 ) / 2
    }
    
    mutating func remove() -> Element? {
        guard !isEmpty else { return nil }
        elements.swapAt(0, count - 1)
        defer { siftDown(from: 0) }
        return elements.removeLast()
    }
    
    mutating func insert(_ element: Element) {
        elements.append(element)
        siftUp(from: elements.count - 1)
    }
    
    mutating func siftUp(from index: Int) {
        var child = index
        var parent = parentIndex(ofChildAt: child)
        
        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(ofChildAt: child)
        }
    }
    
    mutating func siftDown(from index: Int) {
        var parent = index
        while true {
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChildIndex(ofParentAt: parent)
            
            var candidate = parent
            if left < count && sort(elements[left], elements[candidate]) {
                candidate = left
            }
            if right < count && sort(elements[right], elements[candidate]) {
                candidate = right
            }
            
            if candidate == parent {
                return
            }
            
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
}

struct PriorityQueue<Element>: Queue {
    private var heap: Heap<Element>
    
    // sort(우선순위 높은 Element, 우선순위 낮은 Element) -> true
    init(sort: @escaping (Element, Element) -> Bool,
         elements: [Element] = []) {
        heap = Heap(elements: elements, sort: sort)
    }
    
    var isEmpty: Bool { heap.isEmpty }
    
    var peek: Element? { heap.peek() }
    
    mutating func enqueue(_ element: Element) -> Bool {
        heap.insert(element)
        return true
    }
    
    mutating func dequeue() -> Element? {
        heap.remove()
    }
}
