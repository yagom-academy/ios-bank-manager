//
//  Bank.swift
//  Created by Rhode, sehong.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Bank {
    private enum BankStatus: String {
        case open = "1"
        case close = "2"
    }
    
    func openBank() {
        print("1 : 은행개점 \n2 : 종료\n입력 :", terminator: " ")
        guard let status = readLine(),
              let bankStatus = BankStatus(rawValue: status) else {
            print("입력이 잘못되었습니다.")
            openBank()
            return
        }
        startWork(bankStatus)
    }
    
    private func startWork(_ status: BankStatus) {
        switch status {
        case .open:
            return
        case .close:
            return
        }
    }
}
