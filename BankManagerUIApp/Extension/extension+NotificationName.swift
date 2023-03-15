//
//  extension+NotificationName.swift
//  BankManagerUIApp
//
//  Created by 김성준 on 2023/03/15.
//

import Foundation

extension Notification.Name {
    static let enqueue = Notification.Name(rawValue: "enqueue")
    static let dequeue = Notification.Name(rawValue: "dequeue")
    static let finished = Notification.Name(rawValue: "finished")
}
