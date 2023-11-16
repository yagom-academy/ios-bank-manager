//
//  Receivable.swift
//
//
//  Created by jyubong, Toy on 11/16/23.
//


public protocol Receivable {
    associatedtype Customer: CustomerNumbering
    
    func receive(customer: Customer)
}
