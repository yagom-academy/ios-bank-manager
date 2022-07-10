//
//  Showable.swift
//  BankManagerUIApp
//
//  Created by 예톤, 웡빙 on 2022/07/10.
//

import Foundation

protocol WorkProtocol {
    func startProcess(about customer: Customer)
    func endProcess(about customer: Customer)
    func allWorkisFinished()
}
