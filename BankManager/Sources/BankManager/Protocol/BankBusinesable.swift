//
//  BankBusinesable.swift
//
//
//  Created by jyubong, toy
//

public protocol BankBusinesable {
    associatedtype Bankclerk: CustomerReceivable
    
    var bankManager: BankManager<Bankclerk> { get }
    
    func open()
}
