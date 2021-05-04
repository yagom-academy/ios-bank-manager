//
//  BankTaskable.swift
//  BankManagerConsoleApp
//
//  Created by 윤재웅 on 2021/05/04.
//

import Foundation

protocol BankTaskable {
    var waitingNumber: UInt? { get set }
    var creditRate: CreditRating? { get set }
    var workType: WorkType? { get set }
}
