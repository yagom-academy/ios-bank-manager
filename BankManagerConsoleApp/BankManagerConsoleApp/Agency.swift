//
//  Agency.swift
//  BankManagerConsoleApp
//
//  Created by finnn, bard on 2022/07/01.
//

protocol Agency {
    associatedtype T: Equatable
    var customerQueue: Queue<T> { get set }
    
    mutating func generateEmployee(numberOfEmployees: Int)
    mutating func open()
    mutating func close()
}
