//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by mmim, malrang.
//

import Foundation

struct BankClerk: Workable {
    private enum Message {
        static let start = "번 고객 업무 시작"
        static let end = "번 고객 업무 종료"
    }

    private enum Constant {
        static let workTime = 0.7
    }
    
    func deal(with client: Client?) {
        guard let client = client else {
            return
        }
        print("\(client.orderNumber)\(Message.start)")
        Thread.sleep(forTimeInterval: Constant.workTime)
        print("\(client.orderNumber)\(Message.end)")
    }
}
