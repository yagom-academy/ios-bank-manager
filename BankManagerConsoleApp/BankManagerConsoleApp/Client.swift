//
//  Client.swift
//  BankManagerConsoleApp
//  Created by TORI on 2021/05/04.
//

import Foundation

enum ClientType: Int, CaseIterable {
    case VVIP = 0
    case VIP = 1
    case 일반 = 2
}

enum BusinessType: Double, CaseIterable {
    case 예금 = 0.7
    case 대출 = 1.1
}

struct Client {
    let waitingNumber: UInt
    let clientClass: ClientType
    let businessType: BusinessType
}


