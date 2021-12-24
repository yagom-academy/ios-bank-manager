//
//  Workable.swift
//  BankManagerConsoleApp
//
//  Created by yeha on 2021/12/24.
//

import Foundation

protocol Workable {
    func work(for client: Int)
}

extension Workable {
    func work(for client: Int) {
        print("\(client)번 고객 업무 시작")
        Thread.sleep(forTimeInterval: 0.7)
        print("\(client)번 고객 업무 완료")
    }
}
