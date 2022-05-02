//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by OneTool, Red on 2022/04/28.
//

import Foundation

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
