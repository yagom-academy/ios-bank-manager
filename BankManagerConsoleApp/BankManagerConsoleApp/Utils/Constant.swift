//
//  Const.swift
//  BankManagerConsoleApp
//
//  Created by Taeangel, Tiana 2022/04/26.
//

enum Constant {
    enum MenuSelect: String {
        case open = "1"
        case close = "2"
        
        var description: String {
            return self.rawValue
        }
    }
    
    enum Guide: String {
        case menu = """
        1 : 은행 개점
        2 : 종료
        """
        case input = "입력: "
        
        var description: String {
            return self.rawValue
        }
    }
}
