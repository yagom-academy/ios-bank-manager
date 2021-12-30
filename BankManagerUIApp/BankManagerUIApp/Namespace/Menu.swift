//
//  Menu.swift
//  BankManagerConsoleApp
//
//  Created by 양호준 on 2021/12/24.
//

import Foundation

enum Menu {
    static let initialMessage = """
        1 : 은행 개점
        2 : 종료
        입력 :
        """
    
    enum Option {
        static let bankOpen = "1"
        static let bankclosed = "2"
        static let invalidInput = ""
    }
    
    enum Error {
        static let wrongInput = "잘못 누르셨습니다. 다시 눌러주세요"
    }
}
