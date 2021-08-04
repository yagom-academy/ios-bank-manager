//
//  Task.swift
//  BankManagerConsoleApp
//
//  Created by tae hoon park on 2021/08/04.
//

import Foundation

struct Task {
    let dispatchQueue = DispatchQueue.global()
    let semaphore: DispatchSemaphore
}
