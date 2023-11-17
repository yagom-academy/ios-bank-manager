//
//  Receivable.swift
//
//
//  Created by jyubong, Toy on 11/16/23.
//


public protocol CustomerReceivable {
    associatedtype Customer: CustomerNumbering
    
    func receive(customer: Customer, start: ((UInt) -> Void), finish: ((UInt) -> Void))
}
