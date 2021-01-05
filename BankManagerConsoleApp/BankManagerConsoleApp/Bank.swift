//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 강인희 on 2021/01/05.
//

struct Bank {
    var serviceCounter: [Int : BankClerk] = [:]
    var waitingList: [Client] = []
    var totalVistedClientsNumber: Int = 0
    var totalProcessedClientsNumber: Int = 0
    var totalOperatingTime: Float = 0

}
