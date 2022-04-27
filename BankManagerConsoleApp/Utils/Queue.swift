//
//  Queue.swift
//  BankManagerConsoleApp
//
//  Created by OneTool, Red on 2022/04/26.
//

final class Queue<List: Listable> {
    let list: List

    init(listType: List) {
        self.list = listType
    }

    var isEmpty: Bool {
        return list.isEmpty
    }

    var peek: List.Element? {
        return list.first
    }

    func clear() {
        list.removeAll()
    }

    func enQueue(data: List.Element) {
        list.append(value: data)
    }

    func deQueue() -> List.Element? {
        return list.removeFirst()
    }
}
