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
    
    
    init(bankerNumber: Int, client: Client? , notification: NSNotification.Name) {
        self.bankerNumber = bankerNumber
        self.client = client
        self.notification = notification
    }
    
    override func main() {
        if let client = self.client {
            print("\(client.waitingNumber)번 고객 업무 시작")
            Bank.totalBusinessTime += 0.7
            Bank.totalBusinessTime = round( Bank.totalBusinessTime * 100 ) / 100
            print("\(client.waitingNumber)번 고객 업무 완료")
        }
        NotificationCenter.default.post(name: notification, object: nil)
    }
    
    @objc func finishWork(notification : Notification) {
        Bank.lock.lock()
        if Bank.clientQueue.count != 0 {
            let banker = Banker(bankerNumber: bankerNumber ,client: Bank.clientQueue.removeFirst(), notification: self.notification)
            NotificationCenter.default.addObserver(banker, selector: #selector(Banker.finishWork(notification:)), name: self.notification, object: nil)
            Bank.operationQueue.addOperation(banker)
        }
        Bank.lock.unlock()
    }
}
