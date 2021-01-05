//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Wonhee on 2021/01/04.
//

import Foundation

class Bank {
    private var windows: [Window] = []
    private var waitingCustomers = Queue<Customer>()
    lazy var delegate: BankDelegate? = nil
    
    // MARK: - init func
    init(windowNumber: Int, bankersNumber: Int, bankersProcessingTime: Double) {
        initWindow(windowNumber)
        initBankers(number: bankersNumber, processingTime: bankersProcessingTime)
    }
    
    private func initWindow(_ number: Int) {
        for windowNumber in 1...number {
            windows.append(Window(windowNumber: windowNumber))
        }
    }
    
    private func initBankers(number: Int, processingTime: Double) {
        windows = windows.map({ (window: Window) -> Window in
            window.setBanker(Banker(processingTime: processingTime))
            return window
        })
    }
    
    func resetWaitingCustomers() {
        waitingCustomers.removeAll()
    }
    
    func addWaitingCustomer(_ number: Int) {
        for waitingNumber in 1...number {
            waitingCustomers.enqueue(Customer(waitingNumber: waitingNumber, taskAmount: 1))
        }
    }
    
    func assignCustomer(time: Double) throws {
        if waitingCustomers.isEmpty {
            canClose()
            return
        }
        windows = try windows.map { (window: Window) -> Window in
            if !window.isEmptyWindowCustomer() || waitingCustomers.isEmpty {
                return window
            }
            guard let customer = waitingCustomers.dequeue() else {
                throw BankError.unknow
            }
            try window.startCustomerTask(currentTime: time, customer: customer)
            return window
        }
    }
    
    // MARK: - check func
    func checkEndWindow(time: Double) throws {
        windows = try windows.map { (window: Window) -> Window in
            try window.checkEndCustomerTask(currentTime: time)
            return window
        }
    }
    
    func canClose() {
        let allEmptyWindow = windows.reduce(true) { (first, second) -> Bool in
            return first && second.isEmptyWindowCustomer()
        }
        if allEmptyWindow {
            self.delegate?.close()
        }
    }
}

protocol BankDelegate {
    func close()
}
