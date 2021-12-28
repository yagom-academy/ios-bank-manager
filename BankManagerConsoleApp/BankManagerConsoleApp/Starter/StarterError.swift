//
//  BankError.swift
//  BankManagerConsoleApp
//
//  Created by 고은 on 2021/12/23.
//

import Foundation

enum StarterError: Error {
    case wrongInput
    case endOfFile
    case unknownError
    
    func printDescription() {
        switch self {
        case .wrongInput:
            print("잘못된 입력입니다. 다시 입력해주세요.")
        case .endOfFile:
            print("End Of File에 도달했습니다.")
        case .unknownError:
            print("알 수 없는 에러가 발생했습니다.")
        }
    }
}
