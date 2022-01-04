//
//  BankTimerDisplayer.swift
//  BankManagerUIApp
//
//  Created by Jae-hoon Sim on 2022/01/05.
//

import Foundation

protocol BankTimerDisplayer: AnyObject {
    func bank(didUpdateTimer time: String)
}
