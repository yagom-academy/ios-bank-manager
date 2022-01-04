//
//  BankStateDisplayer.swift
//  BankManagerConsoleApp
//
//  Created by Jae-hoon Sim on 2021/12/23.
//

import Foundation

protocol BankStateDisplayer: AnyObject {
    func bank(willBeginServiceFor number: Int, task: String)
    func bank(didEndServiceFor number: Int, task: String)
    func bank(didReceiveDepositClientOf number: Int)
    func bank(didReceiveLoanClientOf number: Int)
}
