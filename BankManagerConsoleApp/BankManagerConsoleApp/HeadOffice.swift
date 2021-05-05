//
//  HeadOffice.swift
//  BankManagerConsoleApp
//
//  Created by sookim on 2021/05/05.
//

import Foundation

class HeadOffice {
    private let headOfficeQueue = OperationQueue()
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(input), name: Notification.Name("HeadOffice"), object: nil)
        headOfficeQueue.maxConcurrentOperationCount = 1
    }
    
    @objc func input(notification: Notification) {
        guard let datas = notification.userInfo else { return }
        
        guard let waitingNumber = datas["waitingNumber"],
              let customerGrade = datas["customerGrade"] else { return }
        
        var array: [HeadOfficeBankTask] = []

        if let waitingNumber = waitingNumber as? Int,
           let customerGrade = customerGrade as? CustomerGrade {
            array.append(HeadOfficeBankTask(waitingNumber: waitingNumber, customerGrade: customerGrade))
        }
        headOfficeQueue.addOperations(array, waitUntilFinished: true)
        Thread.sleep(forTimeInterval: 0.3)
    }
    
}
