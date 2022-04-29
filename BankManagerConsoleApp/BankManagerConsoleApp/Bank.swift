//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Lingo on 2022/04/29.
//

import Foundation

final class Bank {
  private var clientQueue: BankQueue<Client> = BankQueue(limit: 50)
  private var totalClientCount: Int = .zero
  private var totalExecuteTime: Double = .zero
}
