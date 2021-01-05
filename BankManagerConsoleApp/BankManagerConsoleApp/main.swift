//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

//var bankManager = BankManager()
//private var selectedMenu = bankManager.selectMenu()
//
//while selectedMenu == 1 {
//    print("은행개점")
//    selectedMenu = bankManager.selectMenu()
//}
//print("종료")

func selectMenu() -> Int {
    print(" 1 : 은행개점 \n 2 : 종료\n 입력 :", terminator: " ")
    
    if let menuNumber = Int(readLine() ?? "") {
        return menuNumber
    }
    
    return 0
}

//func printMenu() {
//    
//}

func openBank() {
    
}
