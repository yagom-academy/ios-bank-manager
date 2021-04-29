//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by steven on 2021/04/28.
//

import Foundation

struct BankPrinter {

    static func printMenu() {
        print("1 : 은행개점")
        print("2 : 종료")
        print("입력 : ", terminator:"")
    }
    
    static func printFinishPharse(_ totalCustomerNumber: Int, _ totalSecond: Double) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomerNumber)명이며, 총 업무시간은 \(totalSecond.printToTwoDecimalPoint())초입니다.")

    }
    
    static func printWrongInputPharse() {
        print("잘못된 입력입니다. 다시 입력해주세요.")
    }

}

extension Double {

    func printToTwoDecimalPoint() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.roundingMode = .floor
        numberFormatter.maximumFractionDigits = 2
        guard let result = numberFormatter.string(for: self) else {
            return String(self)
        }
        return result
    }

}

struct Inputer {

    static let blank = ""
    
    static func receive() -> String {
        guard let input = readLine() else {
            return blank
        }
        return input
    }
    
}

struct Bank {
    
    private var bankManager: BankManager
    
    init() {
        bankManager = BankManager(numberOfBanker: 1)
    }
    
    private func startWork() {
        let startTime = CFAbsoluteTimeGetCurrent()
        bankManager.inputCustomersToWaitingLine()
        let endTime = CFAbsoluteTimeGetCurrent()
        BankPrinter.printFinishPharse(bankManager.numberOfCustomer, endTime - startTime)
    }
    
    func open() {
        while (true) {
            BankPrinter.printMenu()
            let input = Inputer.receive()
            switch input {
            case "1":
                startWork()
            case "2":
                return
            default:
                BankPrinter.printWrongInputPharse()
            }
        }
    }
    
}
