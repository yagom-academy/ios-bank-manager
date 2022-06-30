//
//  Banker+Protocol.swift
//  BankManagerConsoleApp
//
//  Created by 수꿍, 브래드. on 2022/07/01.
//

protocol Banker {
    var time: Double { get }

    func work(from: inout ClientQueue<Client>) -> Int
}
