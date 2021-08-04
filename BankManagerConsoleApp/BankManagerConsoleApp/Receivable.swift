//
//  Receivable.swift
//  BankManagerConsoleApp
//
//  Created by 오승기 on 2021/08/04.
//

import Foundation

protocol Receivable {
    func customers(customer: Queue<Customer>)
}
