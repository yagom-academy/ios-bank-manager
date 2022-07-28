import Foundation

enum BankManagerNotificationName {
  static let serviceDidBegin = Notification.Name(rawValue: "process")
  static let serviceDidEnd = Notification.Name(rawValue: "finish")
}
