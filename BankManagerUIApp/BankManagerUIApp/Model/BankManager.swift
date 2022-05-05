//
//  BankManager.swift
//  BankManagerUIApp
//
//  Created by 박세웅 on 2022/05/05.
//

import Foundation

struct BankManager {
    private let customerRange: ClosedRange = 10...10
    private let menuString = """
    1 : 은행개점
    2 : 종료
    입력 :
    """
    private var bank: Bank = Bank(numberOfCustomer: 0)

    mutating func startBanking() {
        //printMenu()
        //inputMenu()
        setUpBank()
        bank.work()
        
    }

    private func printMenu() {
        print(menuString, terminator: " ")
    }

    private mutating func inputMenu() {
        guard let input = readLine() else {
            return
        }

        guard let menu: BankManagerMenu = BankManagerMenu(rawValue: input) else {
            startBanking()
            return
        }

        if menu == .open {
            setUpBank()
            bank.work()
            //startBanking()
        } else if menu == .close {
            return
        }
    }

    private mutating func setUpBank() {
        bank.setUpCustomer(number: generateRandomNumber(in: customerRange))
    }

    private func generateRandomNumber(in range: ClosedRange<Int>) -> Int {
        return Int.random(in: range)
    }
}

// MARK: - BankManagerMenu
extension BankManager {
    private enum BankManagerMenu: String {
        case open = "1"
        case close = "2"
    }
}
