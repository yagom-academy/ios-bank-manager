//
//  BankHeadOffice.swift
//  BankManagerConsoleApp
//
//  Created by Wonhee on 2021/01/13.
//

import Foundation

class BankHeadOffice {
    private let workingQueue: DispatchQueue
    
    init() {
        self.workingQueue = DispatchQueue(label: "headOffice")
    }
}
