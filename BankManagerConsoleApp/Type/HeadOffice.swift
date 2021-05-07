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
        guard let banker = notification.userInfo?[UserInformationKey.banker] as? Banker, let client = notification.userInfo?[UserInformationKey.client] as? Client else {
            return
        }
        let clientGrade = banker.convertGradeToString(grade: client.grade)
        lock.lock()
        print("\(client.waitingNumber)번 \(clientGrade) \(client.taskType.rawValue)심사 시작")
        banker.updateBusinessTime(type: BankerTask.deposit)
        banker.operationQueue.isSuspended = false
        print("\(client.waitingNumber)번 \(clientGrade) \(client.taskType.rawValue)심사 완료")
        lock.unlock()
    }
}
