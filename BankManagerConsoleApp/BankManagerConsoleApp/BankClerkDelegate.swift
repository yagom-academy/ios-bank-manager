//
//  BankDelegate.swift
//  BankManagerConsoleApp
//
//  Created by Siwon Kim on 2021/12/24.
//

import Foundation
protocol BankClerkDelegate {
    func printBeginWorkMessage(of customer: Customer)
    func printFinishWorkMessage(of customer: Customer)
}
