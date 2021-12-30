//
//  BankMessagePresenter.swift
//  BankManagerConsoleApp
//
//  Created by Jae-hoon Sim on 2021/12/23.
//

import Foundation

protocol BankMessagePresenter: AnyObject {
    func bankDidClose(totalClient: Int, for duration: String)
    func bank(willBeginServiceFor number: Int, task: String)
    func bank(didEndServiceFor number: Int, task: String)
}
