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
        for customer in customerList {
            for bankclerk in bankclerks {
                if bankclerk.isWorking == false {
                    bankclerk.serveCustomers(customer: customer)
                    break
                }
            }
        }
    }
    
    mutating func openBank() {
        repeat {
            self.bankState = getInput()
            checkBankState(state: self.bankState)
            writeBanKClerkList()
            writeCustomerList()
            distributeCustomer()
        } while self.bankState == BankState.open || self.bankState == BankState.default
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


