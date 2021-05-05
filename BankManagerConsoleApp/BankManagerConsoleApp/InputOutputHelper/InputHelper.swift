//
//  InputHelper.swift
//  BankManagerConsoleApp
//
//  Created by sookim on 2021/05/03.
//

import Foundation

struct InputHelper {

    static func receive() -> String? {
        guard let input = readLine() else { return nil }
        return input
    }
    
}
