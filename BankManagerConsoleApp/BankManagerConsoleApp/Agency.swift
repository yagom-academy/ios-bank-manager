//
//  Agency.swift
//  BankManagerConsoleApp
//
//  Created by finnn, bard on 2022/07/01.
//

protocol Agency {
    associatedtype T: Equatable
    var ticketNumberQueue: Queue<T> { get set }
    
    mutating func open()
    mutating func close()
}
