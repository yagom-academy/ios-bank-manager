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
        guard let userInput = readLine(), let userInputNumber = Int(userInput) else { return nil }
        if userInputNumber == BankMenu.start {
            return true
        } else if userInputNumber == BankMenu.exit {
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
    
    @objc func updateBankCounter(notification: Notification) {
        lock.lock()
        guard let userInformation = notification.userInfo else { return }
        updateTotalBusinessTime(userInformation: userInformation)
        if clientQueue.isNotEmpty {
            guard let bankerNumber = userInformation[UserInformationKey.bankerNumber] as? Int else { return }
            guard let notificationNumber = userInformation[UserInformationKey.notificationNumber] as? NSNotification.Name else { return }
            let banker = Banker(bankerNumber: bankerNumber, client: clientQueue.removeFirst(), notification: notificationNumber)
            operationQueue.addOperation(banker)
        }
        lock.unlock()
    }
    
    func updateTotalBusinessTime(userInformation: [AnyHashable:Any]) {
        guard let businessTime = userInformation[UserInformationKey.businessTime] as? Float else { return }
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
            bank.totalNumberOfClinet = numberOfClient
            createBanker(numberOfBanker: numberOfBanker)
            operationQueue.waitUntilAllOperationsAreFinished()
            bank.closeBusiness()
            removeAllObserver(numberOfObserver: numberOfBanker)
            
        }
    }
    
    func startBank() {
        while true {
            do {
                try manageBank()
                break
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

extension Array {
    @inlinable public var isNotEmpty: Bool {
        if self.isEmpty {
            return false
        }
        return true
    }
}

