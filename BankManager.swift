//
//  BankManager.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum BankState: String {
    case `default` = "0"
    case open = "1"
    case close = "2"
}

struct BankManager {
    private var bankState: BankState = .default
    var customerList: [Customer] = []
    var bankclerks: [BankClerk] = []
    var currentNumber: Int = 0
    
    mutating func writeBanKClerkList() {
        for windowNumber in 1...3 {
            bankclerks.append(BankClerk(windowNumber: windowNumber))
        }
    }
    
    mutating func writeCustomerList() {
        for waitingNumber in 1...countTodayCustomer() {
            guard let customerClass = Customer.Class(rawValue: Customer.setCustomerClass()) else {
                return
            }
            customerList.append(Customer(waitingNumber: waitingNumber, customerClass: customerClass))
        }
    }
    
    mutating func distributeCustomer() {
        var isContinue = true
        
        while isContinue {
            for bankclerk in bankclerks {
                if bankclerk.isWorking == false {
                    if customerList.count == 0 {
                        isContinue = false
                        break
                    }
                    let customer = customerList.removeFirst()
                    bankclerk.queue.async {
                        bankclerk.serveCustomers(customer: customer)
                    }
                    self.currentNumber += 1
                }
            }
        }
    }
    
    mutating func openBank() {
        while self.bankState == BankState.open || self.bankState == BankState.default {
            self.bankState = getInput()
            checkBankState(state: self.bankState)
            writeBanKClerkList()
            writeCustomerList()
            distributeCustomer()
            
        }
    }
    
    func countTodayCustomer() -> Int {
        let customers = Int.random(in: 10...30)
        return customers
    }
    
    @discardableResult func getInput() -> BankState {
        InputStateMessage.printInputProcessText(state: .initialization)
        guard let userInput: String = readLine(), (userInput == BankState.open.rawValue || userInput == BankState.close.rawValue) else {
            InputStateMessage.printInputProcessText(state: .error)
            return BankState.default
        }
        
        if userInput == BankState.open.rawValue {
            return BankState.open
        }
        return BankState.close
    }
    
    func checkBankState(state: BankState) {
        switch state {
        case .open:
            let customers = countTodayCustomer()
            
        //let taskedTime = BankClerk().calculateTime
        //BankerMessage.printCloseBankText(customers: customers, taskedTime: Double(taskedTime))
        case .default, .close:
            break
        }
    }
    
    
}
