//
//  BankDelegate.swift
//  BankManagerConsoleApp
//
//  Created by Jae-hoon Sim on 2021/12/23.
//

import Foundation

protocol BankDelegate {
    func bankDidClose(totalClient: Int, for duration: String)
    func bank(willBeginServiceFor number: Int)
    func bank(didEndServiceFor number: Int)
}
