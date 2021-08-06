//
//  Client.swift
//  BankManagerConsoleApp
//
//  Created by ehd on 2021/08/02.
//

import Foundation

class Client: Node<UInt> {

    let waitingNumber: UInt
    var work: BusinessCategory? = nil

    init(waitingNumber: UInt) {
        self.waitingNumber = waitingNumber
        super.init(data: waitingNumber)
    }
}

