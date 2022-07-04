//
//  Queue+Extensions.swift
//  BankManagerConsoleApp
//
//  Created by 예톤, 웡빙 on 2022/07/01.
//

extension Queue {
    var isEmpty: Bool {
        queue.isEmpty
    }
    var peek: Element? {
        queue.peek
    }
    var count: Int {
        queue.count
    }
    var currentList: [Element?] {
        queue.currentList
    }

    func enqueue(data: Element) {
        queue.append(data: data)
    }

    @discardableResult
    func dequeue() -> Element? {
        queue.removeFirst()
    }

    func clear() {
        queue.clear()
    }
}
