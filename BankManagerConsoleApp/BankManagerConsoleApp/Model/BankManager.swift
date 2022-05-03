//
//  BankManager.swift
//  Created by Taeangel, Tiana 2022/04/25.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

private enum Range: Int {
    case startRandomNumber = 10
    case endRandomNumber = 30
    case startClientNumber = 1
}

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

struct BankManager : Clerkalbe{
    private var bank: Bank
    private let group = DispatchGroup()
    
    init(bank: Bank) {
        self.bank = bank
    }
    
    mutating func start() {
        printDescription()
        guard let input = readLine() else {
            return
        }
        switch input {
        case MenuSelect.open.rawValue:
            manageBank()
            start()
        case MenuSelect.close.rawValue:
            return
        default:
            restart()
        }
    }
    
    private func manageBank() {
        let totalClients = generateClientCount()
        giveWaitingNumber(for: totalClients)
        bank.close(totalDuration: measureTotalTime(), clientCount: totalClients)
    }
    
    private func printDescription() {
        print(Guide.menu.rawValue)
        print(Guide.input.rawValue, terminator: String.empty)
    }
    
    private mutating func restart() {
        print(Guide.error.rawValue)
        start()
    }
    
    private func work() {
        while let client = bank.clients.dequeue() {
            work(client: client, group: group)
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
        group.wait()
        let durationTime = CFAbsoluteTimeGetCurrent() - startTime
        
        return Double(durationTime)
    }
}

// MARK: clients 생성

extension BankManager {
    private func generateClientCount() -> Int {
        return Int.random(in: Range.startRandomNumber.rawValue...Range.endRandomNumber.rawValue)
    }
    
    private func giveWaitingNumber(for clients: Int) {
        for number in Range.startClientNumber.rawValue...clients {
            bank.clients.enqueue(data: Client(waitingNumber: number, task: Task.random))
        }
    }
}
