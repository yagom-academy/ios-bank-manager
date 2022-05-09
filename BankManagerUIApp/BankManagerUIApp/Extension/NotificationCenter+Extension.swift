//
//  NotificationCenter+Extension.swift
//  BankManagerUIApp
//
//  Created by 조민호 on 2022/05/05.
//

import Foundation

extension Notification.Name {
    static let didRecieveClient = Notification.Name("didRecieveClient")
    static let didAssignClientToBankClerk = Notification.Name("didAssignClientToBankClerk")
    static let didFinishWork = Notification.Name("didFinishWork")
}
