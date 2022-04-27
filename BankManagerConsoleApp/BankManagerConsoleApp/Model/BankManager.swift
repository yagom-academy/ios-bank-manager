//
//  BankManager.swift
//  Created by Taeangel, Tiana 2022/04/25.
//  Copyright © yagom academy. All rights reserved.
//

import CoreFoundation

private enum MenuSelect: String {
    case open = "1"
    case close = "2"
}

private enum Guide: String {
    case menu = """
    1 : 은행 개점
    2 : 종료
    """
    case input = "입력: "
    case error = "잘못 눌렀습니다."
}

private enum Text: String {
    case emptyString = ""
}

struct BankManager {
    private var bank: Bank = Bank()
    
    mutating func start() {
        print(Constant.Guide.menu.description)
        print(Constant.Guide.input.description, terminator: "")
        guard let input = readLine() else { return }
        switch input {
        case MenuSelect.open.rawValue:
            bank.open()
            bank.close(totalDuration: work())
            start()
        case MenuSelect.close.rawValue:
            return
        default:
            start()
        }
    }
    
    func checkTime(of method: () -> Void) -> Double {
        let startTime = CFAbsoluteTimeGetCurrent()
        method()
        let durationTime = CFAbsoluteTimeGetCurrent() - startTime
        
        return Double(durationTime)
    }
    
    func work() -> Double {
        let totalClientCount = bank.clientCount

        let duration = checkTime {
            for _ in 0..<totalClientCount {
                guard let client = bank.clients.dequeue() else {
                    return
                }
                bank.clerks[0].work(client: client)
            }
        }
        return duration
    }
}
