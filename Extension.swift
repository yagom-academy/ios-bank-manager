//
//  Extension.swift
//  BankManagerConsoleApp
//
//  Created by goat, Andrew on 2023/03/09.
//

extension Double {
    func digitFormatter() -> String {
        let result: String = String(format: "%.2f", self)
        
        return result
    }
}
