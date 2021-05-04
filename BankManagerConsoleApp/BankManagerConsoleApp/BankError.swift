//
//  BankError.swift
//  BankManagerConsoleApp
//
//  Created by 이영우 on 2021/05/04.
//
//

import Foundation

enum BankError: Error, CustomStringConvertible {
  case invalidNumberOfCustomers
}

extension BankError {
  var description: String {
    switch self {
    case .invalidNumberOfCustomers:
      return "고객의 랜덤 수가 유효하지 않습니다"
    }
  }
}
