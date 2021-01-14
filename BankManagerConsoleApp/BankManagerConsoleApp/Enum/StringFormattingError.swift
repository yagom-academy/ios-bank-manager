//
//  String.swift
//  BankManagerConsoleApp
//
//  Created by 임리나 on 2021/01/05.
//

import Foundation



enum StringFormattingError: Error, CustomStringConvertible {
    case wrongInput
    case unknown
    
    var description: String {
        switch self {
        case .wrongInput:
            return "잘못된 입력입니다. 다시 입력해주세요"
        case .unknown:
            return "알 수 없는 에러가 발생했습니다."
        }
    }
}
