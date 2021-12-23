//
//  LinkedListError.swift
//  BankManagerConsoleApp
//
//  Created by JeongTaek Han on 2021/12/21.
//

import Foundation

enum LinkedListError: LocalizedError {
    case dataDoesNotExist
    
    var description: String {
        switch self {
        case .dataDoesNotExist:
            return "데이터가 존재하지 않습니다."
        }
    }
}
