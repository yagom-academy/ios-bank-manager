//
//  Notification+Attribute.swift
//  BankManagerUIApp
//
//  Created by brody, christy, harry on 2023/03/15.
//

import Foundation

extension Notification.Name {
    static let startJob = Notification.Name(rawValue: "startJob")
    static let finishJob = Notification.Name(rawValue: "finishJob")
}

enum NotificationKey {
    case customer
}
