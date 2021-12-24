//
//  BankDelegate.swift
//  BankManagerConsoleApp
//
//  Created by Siwon Kim on 2021/12/24.
//

import Foundation
protocol BankDelegate {
    func printClosingMessage(customers: Int, processingTime: Double)
}
