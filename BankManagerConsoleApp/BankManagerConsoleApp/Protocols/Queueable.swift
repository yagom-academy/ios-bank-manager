//
//  Queueable.swift
//  BankManagerConsoleApp
//
//  Created by Gundy, jpush on 2022/11/01.
//

public protocol Queueable {}

extension Queueable where Self: Equatable {}

extension String: Queueable {}
extension Int: Queueable {}
