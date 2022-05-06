//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 우롱차, 민성 on 2022/04/28.
//

import UIKit

protocol ViewControllerDelegate: AnyObject {
    func addWaitingClientLabel(text: String, color: UIColor)
    func addWorkingClientLabel(text: String, color: UIColor)
    func removeWorkingClientLabel(text: String, color: UIColor)
    func stopTimer()
    func startTimer()
}

final class Bank {
    private enum Constant {
        static let loanBankClerkCount = 1
        static let depositBankClerkCount = 2
    }

    private var finishedClientCount = 0
    private let loanSemaphore = DispatchSemaphore(value: Constant.loanBankClerkCount)
    private let depositSemaphore = DispatchSemaphore(value: Constant.depositBankClerkCount)
    private let bankGroup = DispatchGroup()
    weak var delegate: ViewControllerDelegate?

    func startWork(clientQueue: inout Queue<Client>) {
        delegate?.startTimer()
        while clientQueue.isEmpty() == false {
            guard let client = clientQueue.dequeue() else {
                return
            }
            
            let clientTaskTypeText = "\(client.waitingNumber) - \(client.taskType.text)"
            let clientTextColor = client.taskType.color
            
            delegate?.addWaitingClientLabel(text: clientTaskTypeText,
                                            color: clientTextColor)
            
            let taskTypeSemphore = self.semaphore(taskType: client.taskType)
            
            DispatchQueue.global().async(group: bankGroup) {
                taskTypeSemphore.wait()
                print(Thread.isMainThread)
                let bankClerk = BankClerk()
                bankClerk.work(client: client, ready: { ()-> Void in
                    DispatchQueue.main.async {
                        self.delegate?.addWorkingClientLabel(text: clientTaskTypeText,
                                                        color: clientTextColor)
                        print("\(client.waitingNumber)번 addworking")
                    }
                }) {
                    DispatchQueue.main.async {
                        self.delegate?.removeWorkingClientLabel(text: clientTaskTypeText,
                                                                color: clientTextColor)
                        print("\(client.waitingNumber)번 removeWork")
                    }
                    self.finishedClientCount += 1
                    taskTypeSemphore.signal()
                    print("\(client.waitingNumber)번 haha")
                }
            }
            bankGroup.notify(queue: .main){
                self.delegate?.stopTimer()
            }
        }
    }

    private func semaphore(taskType: TaskType) -> DispatchSemaphore {
        switch taskType {
        case .deposit:
            return depositSemaphore
        case .loan:
            return loanSemaphore
        }
    }
}
