//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//
struct BankManager {
    func selectMenu() {
        print("""
                1 : 은행개점
                2 : 종료
                입력 :
              """, terminator: "")
        
        guard let input = readLine() else {
            return
        }
        
        switch input {
        case "1":
            print("업무시작")
        case "2":
            return
        default:
            return selectMenu()
        }
    }
}
