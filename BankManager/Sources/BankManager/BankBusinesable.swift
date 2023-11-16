//
//  BankBusinesable.swift
//
//
//  Created by jyubong, toy
//

public protocol BankBusinesable {
    associatedtype Bankclerk: Receivable
    
    var bankManager: BankManager<Bankclerk> { get }
    
    func open()
    func close()
}
