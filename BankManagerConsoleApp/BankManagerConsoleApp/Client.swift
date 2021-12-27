//
//  Clent.swift
//  BankManagerConsoleApp
//
//  Created by Eunsoo KIM on 2021/12/23.
//

import Foundation

struct Client {
  let sequence: Int
  let requiredBankingType: BankingType?
  
  init(sequence: Int) {
    self.sequence = sequence
    self.requiredBankingType = BankingType.allCases.randomElement()
  }
}
