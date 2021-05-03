//
//  BankPrinter.swift
//  BankManagerConsoleApp
//
//  Created by sookim on 2021/05/03.
//

import Foundation

struct BankPrinter {

    static func printMenu() {
        print("1 : 은행개점")
        print("2 : 종료")
        print("입력 : ", terminator:"")
    }
    
    static func printFinishPharse(_ totalCustomerNumber: Int, _ totalSecond: Double) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomerNumber)명이며, 총 업무시간은 \(totalSecond.cutNumberToTwoDecimalPoint())초입니다.")

    }
    
    static func printWrongInputPharse() {
        print("잘못된 입력입니다. 다시 입력해주세요.")
    }

}

extension Double {

    func cutNumberToTwoDecimalPoint() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.roundingMode = .floor
        numberFormatter.maximumFractionDigits = 2
        guard let result = numberFormatter.string(for: self) else {
            return String(self)
        }
        return result
    }

}
