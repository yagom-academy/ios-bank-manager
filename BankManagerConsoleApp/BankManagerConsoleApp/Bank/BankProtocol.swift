//
//  Bankable.swift
//  BankManagerConsoleApp
//
//  Created by Gundy, jpush on 2022/11/04.
//

import Foundation
import BankCustomerQueue

protocol BankProtocol {
    var bankerList: [Banker] { get set }
    var bankCustomerQueue: BankCustomerQueue<BankCustomer> { get set }
    
    mutating func work()
    func close()
    func floatingMenu()
}

extension BankProtocol {
    func floatingMenu() {
        print("""
        1 : 은행 개점
        2 : 종료
        """)
    }
}
