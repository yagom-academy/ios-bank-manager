//
//  Errors.swift
//  BankManagerConsoleApp
//
//  Created by 천수현 on 2021/05/02.
//

import Foundation

enum BankManagerError: Error, CustomDebugStringConvertible {
    case invalidUserInput
    case failToGenerateRandomCustomers
    case failToCaclulateSpentTime
    
    var debugDescription: String {
        switch self {
        case .invalidUserInput:
            return "입력값이 잘못되었어요!😣 1과 2중에서 입력해주세요"
        case .failToGenerateRandomCustomers:
            return "Random Customer를 생성하는 과정에서 오류가 발생했어요 😥"
        case .failToCaclulateSpentTime:
            return "업무시간을 계산하는 과정에서 오류가 발생했어요 😥"
        }
    }
}
