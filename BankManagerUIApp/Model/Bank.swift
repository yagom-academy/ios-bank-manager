//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Eddy, dudu on 2022/04/26.
//

import Foundation

private enum Const {
    static let numberOfDepositClerk = 2
    static let numberOfLoanClerk = 1
}

protocol BankDelegate: AnyObject {
    func customerWorkDidStart(_ bank: Bank, id: String)
    func customerWorkDidFinish(_ bank: Bank, id: String)
    func secondsDidChange(_ bank: Bank, seconds: Double)
}

final class Bank {
    private let waitingQueue = Queue<Customer>()
    private let loanWindow: BankWindow
    private let depositWindow: BankWindow
    private let loanQueue = OperationQueue()
    private let depositQueue = OperationQueue()
    private let endQueue = OperationQueue()
    private(set) var waitingNumber = 1
    weak var delegate: BankDelegate?
    private var timer: Timer?
    private var seconds: Double = 0.0 {
        didSet {
            delegate?.secondsDidChange(self, seconds: seconds)
        }
    }

    init(loanWindow: BankWindow, depositWindow: BankWindow) {
        self.loanWindow = loanWindow
        self.depositWindow = depositWindow
        
        loanQueue.maxConcurrentOperationCount = Const.numberOfLoanClerk
        depositQueue.maxConcurrentOperationCount = Const.numberOfDepositClerk
        endQueue.maxConcurrentOperationCount = 1
    }

    func add(customers: [Customer]) {
        waitingNumber += customers.count
        
        customers.forEach { customer in
            waitingQueue.enqueue(customer)
        }
        
        setTimer()
        sendCustomerToWindow()
    }

    private func sendCustomerToWindow() {
        while let customer = waitingQueue.dequeue() {
            waitingNumber += 1
            
            switch customer.workType {
            case .loan:
                loanQueue.addOperation {
                    self.loanWindow.receive {
                        self.delegate?.customerWorkDidStart(self, id: customer.id)
                    } end: {
                        self.delegate?.customerWorkDidFinish(self, id: customer.id)
                    }
                }
            case .deposit:
                depositQueue.addOperation {
                    self.depositWindow.receive {
                        self.delegate?.customerWorkDidStart(self, id: customer.id)
                    } end: {
                        self.delegate?.customerWorkDidFinish(self, id: customer.id)
                    }
                }
            }
        }
        
        sendNotification()
    }

    func reset() {
        waitingNumber = 1
        loanQueue.cancelAllOperations()
        depositQueue.cancelAllOperations()
        seconds = 0.0
        resetTimer()
    }
    
    private func sendNotification() {
        endQueue.cancelAllOperations()
        
        endQueue.addOperation {
            self.depositQueue.waitUntilAllOperationsAreFinished()
            self.loanQueue.waitUntilAllOperationsAreFinished()
            self.resetTimer()
        }
    }
    
    private func setTimer() {
        if timer == nil {
            let newTimer = Timer.scheduledTimer(timeInterval: 0.003, target: self, selector: #selector(startTimer), userInfo: nil, repeats: true)
            timer = newTimer
            RunLoop.main.add(newTimer, forMode: .common)
        }
    }
    
    private func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc private func startTimer() {
        seconds += 0.003
    }
}
