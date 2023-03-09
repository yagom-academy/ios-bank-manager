//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by 리지, 무리 on 2023/03/08.
//

import Foundation

struct BankClerk {
    func service(to client: Client) {
        let start = "\(client.waitingNumber)번 고객 \(client.purposeOfVisit.rawValue)업무 시작"
        let end = "\(client.waitingNumber)번 고객 \(client.purposeOfVisit.rawValue)업무 완료"
        
        print(start)
        switch client.purposeOfVisit {
        case .loan:
            usleep(1100000)
        case .deposit:
            usleep(700000)
        }
        print(end)
    }
}
