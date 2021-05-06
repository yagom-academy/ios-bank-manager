//
//  HeadOffice.swift
//  BankManagerConsoleApp
//
//  Created by sookim on 2021/05/05.
//

import Foundation

class HeadOffice {
    private let waitingLine = OperationQueue()
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(input), name: Notification.Name("HeadOffice"), object: nil)
        waitingLine.maxConcurrentOperationCount = 1
    }
    
    @objc func input(notification: Notification) {
        guard let datas = notification.userInfo else { return }
        
        guard let waitingNumber = datas["waitingNumber"] as? Int,
              let customerGrade = datas["customerGrade"] as? CustomerGrade else { return }
        
        let loanScreeningTask = LoanScreeningTask(waitingNumber: waitingNumber, customerGrade: customerGrade)
        waitingLine.addOperations([loanScreeningTask], waitUntilFinished: true)

    }
    
}
