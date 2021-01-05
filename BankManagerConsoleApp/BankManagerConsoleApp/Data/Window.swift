//
//  Window.swift
//  BankManagerConsoleApp
//
//  Created by Wonhee on 2021/01/05.
//

import Foundation

class Window {
    private let number: Int
    private var banker: Banker?
    private var customer: Customer?
    
    init(windowNumber: Int) {
        self.number = windowNumber
    }
    
    func setBanker(_ banker: Banker) {
        self.banker = banker
    }
    
    func setCustomer(_ customer: Customer) {
        self.customer = customer
    }
}
