//
//  NotificationKey.swift
//  BankManagerUIApp
//
//  Created by Rowan on 2023/03/15.
//

import Foundation

extension Notification.Name {
    static let waiting = Notification.Name(rawValue: "waiting")
    static let working = Notification.Name(rawValue: "working")
    static let finished = Notification.Name(rawValue: "finished")
}

enum NotificationKey: String {
    case waiting
    case working
    case finished
}
