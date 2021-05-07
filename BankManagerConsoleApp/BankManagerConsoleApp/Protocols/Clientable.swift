//
//  Clientable.swift
//  BankManagerConsoleApp
//
//  Created by Ryan-Son on 2021/05/06.
//

import Foundation

protocol Clientable {
    var waitingNumber: Int { get }
    var grade: Client.Grade { get }
}
