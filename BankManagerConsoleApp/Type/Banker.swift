//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by ysp on 2021/04/27.
//

import Foundation

class Banker: Operation {
    let bankerNumber: Int
    let client: Client?
    let notification: NSNotification.Name
    var businessTime: Float = 0
    let operationQueue = OperationQueue()
    let headOffice: HeadOffice
    
    init(bankerNumber: Int, client: Client?, notification: NSNotification.Name, headOffice: HeadOffice) {
        self.bankerNumber = bankerNumber
        self.client = client
        self.notification = notification
        self.headOffice = headOffice
    }
    
    override func main() {
        if let client = self.client {
            let clientGrade = convertGradeToString(grade: client.grade)
            print("\(client.waitingNumber)번 \(clientGrade) \(client.taskType)업무 시작")
            setBusinessTime(taskType: client.taskType, client: client)
            Thread.sleep(forTimeInterval: Double(businessTime))
            print("\(client.waitingNumber)번 \(clientGrade) \(client.taskType)업무 완료 \(businessTime)")
        }
        NotificationCenter.default.post(name: notification, object: nil, userInfo: [UserInformationKey.bankerNumber: bankerNumber, UserInformationKey.notificationNumber: notification,UserInformationKey.businessTime: businessTime])
    }
    
    private func setBusinessTime(taskType: String, client: Client) {
        if taskType == ClientTask.loan {
            let loanNotification = Notification.Name("\(client.waitingNumber)th Notification")
            NotificationCenter.default.addObserver(headOffice, selector: #selector(HeadOffice.checkLoanRequest(notification:)), name: loanNotification, object: nil)
            updateBusinessTime(time: 0.3) // 대출심사 전
            requestLoan(notificationName: loanNotification, client: client)
            updateBusinessTime(time: 0.3) // 대출심사 후
            NotificationCenter.default.removeObserver(headOffice, name: loanNotification, object: nil)
            return
        }
        updateBusinessTime(time: 0.7)
    }
    
    func updateBusinessTime(time: Float) {
        self.businessTime += time
        Thread.sleep(forTimeInterval: Double(time))
    }
    
    private func requestLoan(notificationName: Notification.Name, client: Client) {
        operationQueue.isSuspended = true
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: [UserInformationKey.banker:self, UserInformationKey.client: client])
        operationQueue.addOperation {}
        operationQueue.waitUntilAllOperationsAreFinished()
    }
    
    func convertGradeToString(grade: Int) -> String {
        switch grade {
        case 1:
            return ClientGrade.vvip
        case 2:
            return ClientGrade.vip
        default:
            return ClientGrade.general
        }
    }
}
