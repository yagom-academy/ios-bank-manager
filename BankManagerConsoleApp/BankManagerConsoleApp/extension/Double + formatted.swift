//
//  Double + formatted.swift
//  BankManagerConsoleApp
//
//  Created by jeremy, LJ on 2022/11/02.
//

import Foundation

extension Double {

    var formattedToString: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumFractionDigits = 2
        guard let result = numberFormatter.string(from: self as NSNumber) else {
            return ""
        }
        
        return result
    }
}
