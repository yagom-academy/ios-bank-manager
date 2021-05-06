//
//  Taskable.swift
//  BankManagerConsoleApp
//
//  Created by steven on 2021/05/06.
//

import Foundation

protocol Taskable {
    var waitingNumber: Int { get }
    var customerGrade: CustomerGrade { get }
}
