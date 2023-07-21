//
//  BankSystemError.swift
//  BankManagerConsoleApp
//
//  Created by Yetti, redmango1446 on 2023/07/21.
//
import Foundation

enum BankSystemError: LocalizedError {
    case noTask
    
    var errorDescription: String? {
        switch self {
        case .noTask:
            return "업무가 존재하지 않습니다."
        }
    }
}
