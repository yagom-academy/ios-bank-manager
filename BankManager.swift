//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    
    func selectMenu() -> Int {
        print(" 1 : 은행개점 \n 2 : 종료\n 입력 :", terminator: " ")
        
        if let menuNumber = Int(readLine() ?? "") {
            return menuNumber
        }
        
        return 0
    }
}
