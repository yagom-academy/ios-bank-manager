//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by OneTool, Red on 2022/04/28.
//

import Foundation

extension Const {
    static let bankersNumber = 3
    static let workTimeForCustomer: Double = 0.7
    
    static let twoDecimal = "%.2f"
    static let startBankSelect = "1 : 은행 개점\n2 : 종료\n입력 : "
    static let blank = ""
    static let wrongInput = "잘못된 입력 입니다."
    static let finishWork = "업무가 마감 되었습니다."
    static let OpeningInput = "1"
    static let exitInput = "2"
}

final class BankManager {
    var bank: Bank = Bank(numberOfBankers: 3)
    
    func manageBanker() {
        let banker = Banker()
        let workGroup = DispatchGroup()
        for _ in 1...bank.numberOfCustomer {
            bank.numberOfBankers.wait()
            let custormer = bank.customers.deQueue()
            DispatchQueue.global().async(group: workGroup) {
                banker.work(customer: custormer)
                self.bank.numberOfBankers.signal()
            }
            self.bank.wholeWorkTime += Const.workTimeForCustomer
        }
        workGroup.wait()
    }
    
    func openBank() {
        print(Const.startBankSelect, terminator: Const.blank)
        guard let userChoice = readLine() else {
            print(Const.wrongInput)
            return
        }
        choose(userChoice: userChoice)
    }
    
    private func choose(userChoice: String) {
        switch userChoice {
        case Const.OpeningInput:
            manageBanker()
            print(Const.finishWork)
            print("오늘 업무를 처리한 고객은 총 \(bank.numberOfCustomer)명이며, 총 업무 시간은 \(String(format: Const.twoDecimal, bank.wholeWorkTime))초 입니다.")
            bank.wholeWorkTime = Double.zero
        case Const.exitInput:
            return
        default:
            print(Const.wrongInput)
        }
    }
}
