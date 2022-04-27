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
        printDescription()
        guard let input = readLine() else {
            return
        }
        switch input {
        case MenuSelect.open.rawValue:
            bank.open()
            bank.close(totalDuration: measureTotalTime())
            start()
        case MenuSelect.close.rawValue:
            return
        default:
            restart()
        }
    }
    
    private func printDescription() {
        print(Guide.menu.rawValue)
        print(Guide.input.rawValue, terminator: Text.emptyString.rawValue)
    }
    
    private mutating func restart() {
        print(Guide.error.rawValue)
        start()
    }
    
    private func work() {
        while let client = bank.clients.dequeue() {
            bank.clerks[0].work(client: client)
        }
    }
    
    private func measureTotalTime() -> Double {
        let duration = measureTime {
            work()
        }
        
        return duration
    }
    
    private func measureTime(of task: () -> Void) -> Double {
        let startTime = CFAbsoluteTimeGetCurrent()
        task()
        let durationTime = CFAbsoluteTimeGetCurrent() - startTime
        
        return Double(durationTime)
    }
}
