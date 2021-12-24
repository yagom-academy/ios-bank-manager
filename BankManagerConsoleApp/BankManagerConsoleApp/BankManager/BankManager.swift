//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct BankManager {
    
    private let bank = Bank()
    
    init() {
        bank.delegate = self
    }
    
    func startConsole() {
        let choice = askMenu()
        switch choice {
        case ConsoleMessage.open.input:
            openBank()
            startConsole()
        case ConsoleMessage.exit.input:
            return
        default:
            restartConsole()
        }
    }
    
    private func askMenu() -> String {
        print(ConsoleMessage.menu, terminator: String.empty)
        return readLine() ?? String.empty
    }
    
    private func openBank() {
        let clientCount = Int.random(in: 10...30)
        let firstNumber = 1
        
        for order in firstNumber...clientCount {
            let client = Client(waitingNumber: order, task: Task.random)
            bank.lineUp(client)
        }
        bank.start()
    }
    
    private func restartConsole() {
        print(ConsoleMessage.invalidInput)
        startConsole()
    }
}

extension BankManager: BankDelegate {
    func bankDidClose(totalClient: Int, for duration: String) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalClient)명이며, 총 업무시간은 \(duration)초입니다.")
    }
    
    func bank(willBeginServiceFor number: Int) {
        print("\(number)번 고객 업무 시작")
    }
    
    func bank(didEndServiceFor number: Int) {
        print("\(number)번 고객 업무 완료")
    }
}
