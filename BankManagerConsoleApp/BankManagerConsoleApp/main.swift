//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

func printOpenBank() {
    print("1 : 은행 개점\n2 : 종료\n입력 : ", terminator:"")
}

func inputNumber() -> String {
    guard let input = readLine() else { print("입력하지 않아서 종료합니다."); return "0" }
    return input
}

printOpenBank()
inputNumber()
