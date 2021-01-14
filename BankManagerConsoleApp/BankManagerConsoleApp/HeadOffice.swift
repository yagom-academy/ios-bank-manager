//
//  HeadOffice.swift
//  BankManagerConsoleApp
//
//  Created by 임리나 on 2021/01/09.
//

import Foundation

final class HeadOffice {
    static let shared = HeadOffice()
    private let neededTimeToJudgeLoan: TimeInterval = 0.5
    let loanQueue: DispatchQueue = DispatchQueue(label: "HeadOffice")
    
    private init() {}
    
    func judgeLoan(for client: Client) {
        Dashboard.printStatus(for: client, about: Message.loanStart)
        Thread.sleep(forTimeInterval: self.neededTimeToJudgeLoan)
        Dashboard.printStatus(for: client, about: Message.loanFinish)
    }
}
