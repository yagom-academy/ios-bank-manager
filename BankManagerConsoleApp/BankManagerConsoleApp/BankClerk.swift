//
//  BankClerk.swift
//  Created by sunnycookie, inho
//

import Foundation

struct BankClerk: Servable {
    let bankingType: BankingType
    let processingTime: Double
    let counter: DispatchQueue
}
