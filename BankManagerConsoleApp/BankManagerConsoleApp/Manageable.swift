//
//  Managable.swift
//  BankManagerConsoleApp
//
//  Created by mint, Jusbug on 2023/07/13.
//

protocol Manageable {
    var name: String { get }
    
    mutating func open()
}
