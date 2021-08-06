//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

private enum Menu: String {
    case open = "1"
    case close = "2"
}

private func printMenu() {
    print("1 : 은행 개점\n2 : 종료\n입력 : ", terminator: "")
}

private func getInputValue() -> Menu? {
    guard let input = readLine() else {
        return nil
    }
    return Menu(rawValue: input)
}

private func open() {
    let minCustomerCount = 10
    let maxCustomerCount = 30
    let randomNumber = Int.random(in: minCustomerCount...maxCustomerCount)
    let bank = BankManager(window: Clerk(deposit: 2, loan: 1), numberOfCustomer: randomNumber)

    while true {
        printMenu()
        let menu = getInputValue()
        switch menu {
        case .open:
            bank.processTask()
        case .close:
            return
        default:
            print("잘 못 입력되었습니다. 1 또는 2를 입력하세요.")
        }
    }
}

open()
