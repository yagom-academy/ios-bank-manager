//
//  Tellers.swift
//  BankManagerConsoleApp
//
//  Created by 리나 on 2021/01/13.
//

import Foundation

struct Tellers {
    var list: [Teller] = []
    
    init(count: Int) {
        for windowNumber in 1...count {
            list.append(Teller(windowNumber: windowNumber))
        }
    }
}
