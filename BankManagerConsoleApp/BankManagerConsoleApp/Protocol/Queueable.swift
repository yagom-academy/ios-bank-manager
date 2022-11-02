//
//  Queueable.swift
//  BankManagerConsoleApp
//
//  Created by Kyo, Wonbi on 2022/11/02.
//

protocol Queueable {
    associatedtype Element
    
    var list: LinkedList<Element> { get set }
}
