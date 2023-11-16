//
//  BankBusinesable.swift
//
//
//  Created by jyubong, toy
//

public protocol BankBusinesable {
    var bankManager: BankManager { get }
    
    func open()
    func close()
}
