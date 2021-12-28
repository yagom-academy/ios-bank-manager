//
//  BankService.swift
//  BankManagerConsoleApp
//
//  Created by JeongTaek Han on 2021/12/28.
//

import Foundation

enum BankService: CaseIterable {
    
    case deposit
    case loan
    
    static func selectRandom() -> BankService {
        let serviceIndex = Int.random(in: BankService.allCases.indices)
        let service = BankService.allCases[serviceIndex]
        return service
    }
}
