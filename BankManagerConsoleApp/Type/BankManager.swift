//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by 최정민 on 2021/04/27.
//

import Foundation

class BankManager {
    
    private var bank = Bank(totalNumberOfClinet: 0)
    private var clientQueue: [Client] = []
    private var operationQueue = OperationQueue()
    private let lock = NSLock()
    private let headOffice = HeadOffice()

    private func startBankMenu() {
        print("1 : 은행 개점 \n2 : 종료")
        print("입력 :", terminator: " " )
    }
    
    private func checkInputValidation() throws -> Bool {
        guard let userInput = readLine(), let userInputNumber = Int(userInput) else { throw BankError.userInput }
        if userInputNumber == BankMenu.start {
            return true
        } else if userInputNumber == BankMenu.exit {
            return false
        }
        throw BankError.userInput
    }
    
    private func createClient(numberOfClient: Int) -> Int {
        for clientNumber in 1...numberOfClient {
            let grade = Int.random(in: 1...3)
            let taskTypeNumber = Int.random(in: 1...2)
            let taskType = setTaskType(taskTypeNumber: taskTypeNumber)
            let client = Client(grade: grade, waitingNumber: clientNumber, taskType: taskType)
            clientQueue.append(client)
        }
        clientQueue = clientQueue.sorted(by: {$0.grade < $1.grade})
        return numberOfClient
    }
    
    private func setTaskType(taskTypeNumber: Int) -> String {
        if taskTypeNumber == 1 {
            return ClientTask.loan
        }
        return ClientTask.deposit
    }
    
    private func createBanker(numberOfBanker: Int) {
        for i in 1...numberOfBanker {
            let notification = NSNotification.Name.init("\(i)th Banker")
            let banker = Banker(bankerNumber: i ,client: nil, notification: notification, headOffice: headOffice)
            NotificationCenter.default.addObserver(self, selector: #selector(BankManager.updateBankCounter(notification:)), name: notification, object: nil)
            operationQueue.addOperation(banker)
        }
    }
    
    private func removeAllObserver(numberOfObserver: Int) {
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
            guard let bankerNumber = userInformation[UserInformationKey.bankerNumber] as? Int, let notificationNumber = userInformation[UserInformationKey.notificationNumber] as? NSNotification.Name else { return }
            let banker = Banker(bankerNumber: bankerNumber, client: clientQueue.removeFirst(), notification: notificationNumber, headOffice: headOffice)
            operationQueue.addOperation(banker)
        }
        lock.unlock()
    }
    
    private func updateTotalBusinessTime(userInformation: [AnyHashable: Any]) {
        guard let businessTime = userInformation[UserInformationKey.businessTime] as? Float else { return }
        bank.totalBusinessTime += businessTime
        bank.totalBusinessTime = round( bank.totalBusinessTime * 100 ) / 100
    }
    
    func startBank() {
        let numberOfBanker: Int = 3
        while true {
            startBankMenu()
            do {
                let isValid = try checkInputValidation()
                guard isValid else { return }
            } catch {
                print(error.localizedDescription)
                continue
            }
            let numberOfClient = createClient(numberOfClient: Int.random(in: 10...30))
            bank.totalNumberOfClinet = numberOfClient
            createBanker(numberOfBanker: numberOfBanker)
            operationQueue.waitUntilAllOperationsAreFinished()
            bank.closeBusiness()
            removeAllObserver(numberOfObserver: numberOfBanker)
        }
    }
}

extension Array {
    public var isNotEmpty: Bool {
        return !self.isEmpty
    }
}

