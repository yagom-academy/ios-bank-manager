//
//  Dashboard.swift
//  BankManagerConsoleApp
//
//  Created by 임리나 on 2021/01/09.
//

import Foundation

struct Dashboard {
    static func printMenu() {
        print(Menu.description, terminator: " ")
    }
    
    static func printStatus(for client: Client, about message: String) {
        let message = String(format: message, client.waitingNumber, "\(client.priority)", "\(client.businessType)")
        print(message)
    }
    
    static func printCloseMessage(_ count: Int, _ time: TimeInterval?) {
        guard let time = time else {
            print("\(StringFormattingError.unknown)")
            return
        }
        let message = String(format: Message.close, count, time)
        print(message)
    }
}
