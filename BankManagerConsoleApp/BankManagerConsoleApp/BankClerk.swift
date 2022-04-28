//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by mmim, malrang.
//

import Foundation

struct BankClerk: Workable {
    private enum Constant {
        static let startMessage = "번 고객 업무 시작"
        static let endMessage = "번 고객 업무 종료"
        static let workTime = 0.7
    }
    
    func deal(with client: Client?) {
        guard let client = client else {
            return
        }
        print("\(client.orderNumber)\(Constant.startMessage)")
        Thread.sleep(forTimeInterval: Constant.workTime)
        print("\(client.orderNumber)\(Constant.endMessage)")
    }
}
