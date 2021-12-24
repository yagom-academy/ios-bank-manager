//
//  Workable.swift
//  BankManagerConsoleApp
//
//  Created by yeha on 2021/12/24.
//

import Foundation

protocol Workable {
    func startWork(by clerkNumber: Int) -> DispatchQueue
}

extension Workable {
    func startWork(by clerkNumber: Int) -> DispatchQueue {
        return DispatchQueue(label: "clerk\(clerkNumber)")
    }
}
