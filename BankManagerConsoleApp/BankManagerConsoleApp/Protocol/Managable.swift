//
//  Managable.swift
//  BankManagerConsoleApp
//
//  Created by yeha on 2021/12/24.
//

import Foundation

protocol Managable {
    func giveWork(to clerkNumber: Int) -> DispatchQueue
}

extension Managable {
    func giveWork(to clerkNumber: Int) -> DispatchQueue {
        return DispatchQueue(label: "clerk\(clerkNumber)")
    }
}
