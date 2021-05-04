//
//  HeadOffice.swift
//  BankManagerConsoleApp
//
//  Created by 최정민 on 2021/05/04.
//

import Foundation

class HeadOffice {
    let lock = NSLock()
    @objc func checkLoanRequest(notification: Notification) {
        guard let userInformation = notification.userInfo else { return }
        guard let banker = userInformation["banker"] as? Banker, let client = userInformation["client"] as? Client else {
            return
        }
        let clientGrade = banker.convertGradeToString(grade: client.grade)
        lock.lock()
        print("\(client.waitingNumber)번 \(clientGrade) \(client.taskType)심사 시작")
        banker.businessTime += 0.5
        banker.operationQueue.isSuspended = false
        print("\(client.waitingNumber)번 \(clientGrade) \(client.taskType)심사 완료")
        lock.unlock()
    }
}
