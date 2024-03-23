//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
import BankManager

enum BankWork {
    case start
    case stop
    
    init?(input: String) {
        switch input {
        case "1":
            self = .start
        case "2":
            self = .stop
        default:
            return nil
        }
    }
}

func startBanking() async throws {
    var nowWorking: Bool = true
    
    while nowWorking {
        print("1 : 은행개점")
        print("2 : 종료")
        print("입력 : ", terminator: " ")
        
        guard let input = readLine(), let choice = BankWork(input: input) else {
            print("잘못된 입력입니다! 1 또는 2를 입력해주세요.")
            continue
        }
        
        switch choice {
        case .start:
            var bankManager = BankManager()
            do {
                try await bankManager.openBank()
            } catch {
                print("Error")
            }
        case .stop:
            nowWorking = false
        }
    }
}

try await startBanking()
