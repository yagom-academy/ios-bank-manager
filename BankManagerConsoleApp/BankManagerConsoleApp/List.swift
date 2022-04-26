//
//  List.swift
//  BankManagerConsoleApp
//
//  Created by OneTool, Red on 2022/04/27.
//

protocol Listable {
    associatedtype Element
    var isEmpty: Bool { get }
    var first: Element? { get }
    var last: Element? { get }

    func append(value: Element)
    func removeAll()
    func removeFirst() -> Element?
}
