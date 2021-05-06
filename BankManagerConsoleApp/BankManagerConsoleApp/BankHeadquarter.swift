//
//  BankHeadquarter.swift
//  BankManagerConsoleApp
//
//  Created by Ryan-Son on 2021/05/06.
//

import Foundation

struct BankHeadquarter {
    // MARK: - Properties
    static let semaphore: DispatchSemaphore = DispatchSemaphore(value: 1)
    
    // MARK: - Name spaces
    enum Task {
        case loanScreening
        
        var processTime: Double {
            switch self {
            case .loanScreening:
                return 0.5
            }
        }
    }
    
    static func screenLoan(for client: Client) -> Bool {
        semaphore.wait()
        
        print("🧾 \(client.waitingNumber)번 \(client.grade.name)고객 대출 심사 시작")
        Thread.sleep(forTimeInterval: Task.loanScreening.processTime)
        print("👍 \(client.waitingNumber)번 \(client.grade.name)고객 대출 심사 완료")
        
        semaphore.signal()
        
        return true
    }
}
