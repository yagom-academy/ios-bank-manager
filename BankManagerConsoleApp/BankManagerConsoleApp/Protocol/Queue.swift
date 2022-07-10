//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by 예톤, 웡빙 on 2022/06/30.
//

protocol Queue {
    associatedtype Element
    
    var queue: LinkedList<Element> { get }
    var isEmpty: Bool { get }
    var peek: Element? { get }
    var count: Int { get }
    var currentList: [Element?] { get }
    
    func enqueue(data: Element)
    func dequeue() -> Element?
    func clear()
}
