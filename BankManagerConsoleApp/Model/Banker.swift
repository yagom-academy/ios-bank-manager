//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by ysp on 2021/04/27.
//

import Foundation

struct Banker {
    var identityNumber: Int
    var counterNumber: Int

    static func handleClientBussiness() {
        Bank.totalBusinessTime += 0.7
    }
}


