//
//  HeadOffice.swift
//  BankManagerConsoleApp
//
//  Created by 임리나 on 2021/01/09.
//

import Foundation

class HeadOffice {
    static let shared = HeadOffice()
    var loanQueue: DispatchQueue
    
    private init() {}
    
    func judgeLoan() {
        loanQueue.async {
            <#code#>
        }
    }
}
