//
//  HeadOffice.swift
//  BankManagerConsoleApp
//
//  Created by 임리나 on 2021/01/09.
//

import Foundation

class HeadOffice {
    static let shared = HeadOffice()
    var loanQueue: DispatchQueue = DispatchQueue(label: "HeadOffice")
    let needTimeToJudgeLoan: TimeInterval = 0.5
    
    private init() {}
    
    func judgeLoan(for client: Client) {
        Dashboard.printStatus(for: client, about: Message.loanStart)
        Thread.sleep(forTimeInterval: self.needTimeToJudgeLoan)
        Dashboard.printStatus(for: client, about: Message.loanFinish)
    }
}
