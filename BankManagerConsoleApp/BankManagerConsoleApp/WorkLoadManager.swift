//
//  WorkLoadManager.swift
//  BankManagerConsoleApp
//
//  Created by jeremy, LJ on 2022/11/02.
//
import Foundation

struct WorkLoadManager {
    var taskQueue: CustomerQueue = CustomerQueue<Int>()
    let loanQueue: DispatchQueue = DispatchQueue(label: "loanQueue", attributes: .concurrent)
    let depositQueue: DispatchQueue = DispatchQueue(label: "depositQueue", attributes: .concurrent)

}
