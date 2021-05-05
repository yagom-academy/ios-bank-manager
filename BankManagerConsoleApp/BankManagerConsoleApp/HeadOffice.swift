//
//  HeadOffice.swift
//  BankManagerConsoleApp
//
//  Created by sookim on 2021/05/05.
//

import Foundation

class HeadOffice {
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(input), name: Notification.Name("HeadOffice"), object: nil)
    }
    
    @objc func input(notification: Notification) {
        print("대기열에 집어 넣음")
    }
}
