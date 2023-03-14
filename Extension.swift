//
//  Extension.swift
//  BankManagerConsoleApp
//
//  Created by 송종환 on 2023/03/09.
//

import Foundation

extension Double {
    func digitFormatter() -> String {
        let result: String = String(format: "%.2f", self)
        
        return result
    }
}
