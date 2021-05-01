//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by 최정민 on 2021/04/27.
//

import Foundation

class BankManager {
    
    var bank = Bank(totalNumberOfClinet: 0)
    var clientQueue: [Client] = []
    var operationQueue = OperationQueue()
    let lock = NSLock()

    private func startBankMenu() {
        print("1 : 은행 개점 \n2 : 종료")
        print("입력 :", terminator: " " )
    }
    
    private func checkInputValidation() -> Bool? {
        guard let userInput = readLine() else { return nil }
        guard let userInputNumber = Int(userInput) else { return nil }
        if userInputNumber == 1 {
            return true
        } else if userInputNumber == 2 {
            return false
        }
        return nil
    }
    
    private func createClient(numberOfClient: Int) -> Int {
        for clientNumber in 1...numberOfClient {
            clientQueue.append(Client(waitingNumber: clientNumber))
        }
        return numberOfClient
    }
    
    private func createBanker(numberOfBanker: Int) {
        for i in 1...numberOfBanker {
            let notification = NSNotification.Name.init("\(i)th Banker")
            let banker = Banker(bankerNumber: i ,client: nil, notification: notification)
            NotificationCenter.default.addObserver(self, selector: #selector(BankManager.updateBankCounter(notification:)), name: notification, object: nil)
            operationQueue.addOperation(banker)
        }
    }
    
    func removeAllObserver(numberOfObserver: Int) {
        for i in 1...numberOfObserver {
            let notification = NSNotification.Name.init("\(i)th Banker")
            NotificationCenter.default.removeObserver(self, name:notification, object:nil)
        }
    }
    
    @objc func updateBankCounter(notification : Notification) {
        lock.lock()
        guard let userInformation = notification.userInfo else { return }
        updateTotalBusinessTime(userInformation:userInformation)
        if clientQueue.count != 0 {
            guard let bankerNumber = userInformation["bankerNumber"] as? Int else { return }
            guard let notificationNumber = userInformation["notificationNumber"] as? NSNotification.Name else { return }
            let banker = Banker(bankerNumber: bankerNumber ,client: clientQueue.removeFirst(), notification: notificationNumber)
            operationQueue.addOperation(banker)
        }
        lock.unlock()
    }
    
    func updateTotalBusinessTime(userInformation: [AnyHashable:Any]) {
        guard let businessTime = userInformation["businessTime"] as? Float else { return }
        bank.totalBusinessTime += businessTime
        bank.totalBusinessTime = round( bank.totalBusinessTime * 100 ) / 100
    }
    
    func manageBank() throws {
        let numberOfBanker: Int = 1
        while true {
            startBankMenu()
            guard let isValid = checkInputValidation() else { throw BankError.userInput }
            guard isValid else { return }
            let numberOfClient = createClient(numberOfClient: Int.random(in: 10...30))
            self.bank = Bank(totalNumberOfClinet: numberOfClient)
            createBanker(numberOfBanker: numberOfBanker)
            operationQueue.waitUntilAllOperationsAreFinished()
            bank.closeBusiness()
            removeAllObserver(numberOfObserver: numberOfBanker)
            
        }
    }
    
    func startBank() {
        do {
            try manageBank()
        } catch {
            print(error.localizedDescription)
        }
    }
}


