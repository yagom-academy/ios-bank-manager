//
//  BankManager.swift
//  Created by Taeangel, Tiana 2022/04/25.
//  Copyright © yagom academy. All rights reserved.
//

import CoreFoundation

struct BankManager {
    var bank: Bank = Bank()
    
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
    
    mutating func start() {
        print(Constant.Guide.menu.description, terminator: "")
        guard let input = readLine() else { return }
        switch input {
        case Constant.MenuSelect.open.description:
            bank.open()
            start()
        case Constant.MenuSelect.close.description:
            return
        default:
            start()
        }
    }
    
    func checkTime(of method: () -> Void) -> Double {
        let startTime = CFAbsoluteTimeGetCurrent()
        method()
        let durationTime = CFAbsoluteTimeGetCurrent() - startTime
        
        return Double(durationTime)
    }
}
