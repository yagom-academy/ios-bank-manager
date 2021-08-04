//
//  BankTeller.swift
//  BankManagerConsoleApp
//
//  Created by Luyan, Marco on 2021/08/04.
//

import Foundation

struct BankTeller {
    let bankingTask: BankingTask
    
    func serve(_ client: Client, completion: () -> Void) {
        print("\(client.waitingNumber)번 고객 \(bankingTask)업무 시작")
//        Thread.sleep(forTimeInterval: bankingTask.processingTime)
        let runLoop = RunLoop.current
        Timer.scheduledTimer(withTimeInterval: bankingTask.processingTime, repeats: false) { _ in
            print("\(client.waitingNumber)번 고객 \(bankingTask)업무 완료")
        }
        runLoop.run()
        
        completion()
    }
}
