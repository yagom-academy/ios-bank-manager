//
//  BankTaskType.swift
//  BankManagerConsoleApp
//
//  Created by Lingo, Cathy on 2022/05/04.
//

import Foundation

protocol BankTaskType {
  var semaphore: DispatchSemaphore { get }
  func execute(_ client: Client)
}
