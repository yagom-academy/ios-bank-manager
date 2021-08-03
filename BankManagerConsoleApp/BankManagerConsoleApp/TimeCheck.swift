//
//  TimeCheck.swift
//  BankManagerConsoleApp
//
//  Created by 이윤주 on 2021/08/03.
//

import Foundation

public func timeCheck(_ block: () -> Void) -> String {
    let start = Date()
    block()
    let totalTime = Date().timeIntervalSince(start)
    return totalTime.description
}
