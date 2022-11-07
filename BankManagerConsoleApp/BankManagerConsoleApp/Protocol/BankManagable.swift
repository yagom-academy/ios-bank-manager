//
//  BankManagable.swift
//  BankManagerConsoleApp
//
//  Created by Kyo, Wonbi on 2022/11/07.
//

protocol BankManagable {
    mutating func addClientCount()
    mutating func resetWorkTime()
    mutating func addWorkTime()
    mutating func printWorkFinished()
}
