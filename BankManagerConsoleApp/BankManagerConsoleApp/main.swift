//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var customer: BankManager.BankClient = BankManager.BankClient(number: 0)
var banker: BankManager.BankClerk = BankManager.BankClerk(bankWindowNumber: 1, taskState: true, client: customer)

func printMenu() {
    print("1 : 은행 개점\n2 : 종료\n입력 : ", terminator:"")
}

func inputText() -> String{
    guard let input: String = readLine() else { return "입력하지 않았습니다" }
    return input
}

func main() {
    printMenu()
    let menu: String = inputText()
    
    switch menu {
    case "1":
        banker.task()
        main()
    case "2":
        return
    default:
        print("잘못 입력하였습니다. 다시 입력해주세요.")
        main()
    }
}

main()
