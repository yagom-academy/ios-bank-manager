//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by Yejin Hong on 3/20/24.
//

import Foundation

enum InputMenu: String {
    case open
    case close
    
    var status: String {
        switch self {
        case .open:
            return "1"
        case .close:
            return "2"
        }
    }
}

struct BankManager {
    func executeBankManager(){
        
        print("1 : 은행개점\n2 : 종료")
        
        guard let input = readLine(), !input.isEmpty else {
            print("아무것도 입력되지 않았습니다!")
            return
        }
        
        switch input {
        case InputMenu.open.status:
            print("1")
        case InputMenu.close.status:
            print("2")
        default:
            print("0")
        }
    }
}
