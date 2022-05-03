//
//  BankClerk.swift
//  BankManagerConsoleApp
//
//  Created by Taeangel, Tiana 2022/04/26.

import Foundation

enum ClerkCount {
    static let deposit = 2
    static let loan = 1
}

enum BankClerk {
    static let deposit = DispatchSemaphore(value: ClerkCount.deposit)
    static let loan = DispatchSemaphore(value: ClerkCount.loan)
}
