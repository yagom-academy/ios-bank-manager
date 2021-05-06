//
//  Constants.swift
//  BankManagerConsoleApp
//
//  Created by 김찬우 on 2021/05/06.
//

import Foundation

enum Constants {
    enum Teller {
        static let taskTime: TimeInterval = 0.7
    }

    enum ConsoleController {
        static let menuScript: String = """
        1 : 은행개점
        2 : 종료
        """
        static let customerNumberRange: ClosedRange<Int> = 10...30
    }
}
