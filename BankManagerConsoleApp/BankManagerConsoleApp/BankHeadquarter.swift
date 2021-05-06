//
//  BankHeadquarter.swift
//  BankManagerConsoleApp
//
//  Created by Yun, Ryan on 2021/05/06.
//

import Foundation

struct BankHeadquarter {
    // MARK: - Properties
    private static let semaphore: DispatchSemaphore = DispatchSemaphore(value: 1)
    
    // MARK: - Name spaces
    private enum Task {
        case loanScreening
        
        var processTime: Double {
            switch self {
            case .loanScreening:
                return 0.5
            }
        }
    }
    
    // MARK: - Private Methods
    static func startLoanScreening(of client: Clientable) -> String {
        return "🧾 \(client.waitingNumber)번 \(client.grade.name)고객 대출심사 시작."
    }
    
    static func endLoanScreening(of client: Clientable) -> String {
        return "👍 \(client.waitingNumber)번 \(client.grade.name)고객 대출심사 완료!"
    }
    
    
    static func screenLoan(for client: Clientable) -> Bool {
        semaphore.wait()
        
        let startLoanScreeningText: String = startLoanScreening(of: client)
        let endLoanScreeningText: String = endLoanScreening(of: client)
        
        print(startLoanScreeningText)
        Thread.sleep(forTimeInterval: Task.loanScreening.processTime)
        print(endLoanScreeningText)
        
        semaphore.signal()
        
        return true
    }
}
