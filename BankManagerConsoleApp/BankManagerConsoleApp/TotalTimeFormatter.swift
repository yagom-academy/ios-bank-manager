//
//  TotalTimeFormatter.swift
//  BankManagerConsoleApp
//
//  Created by idinaloq, EtialMoon on 2023/07/19.
//

import Foundation

struct TotalTimeFormatter {
    static func string(for totalTime: TimeInterval) -> String {
        let numberFormatter: NumberFormatter = {
            let numberFormatter = NumberFormatter()
            numberFormatter.maximumFractionDigits = 2
            numberFormatter.minimumFractionDigits = 2
            return numberFormatter
        }()
        
        guard let totalProcessTime = numberFormatter.string(for: totalTime) else { return "" }
        
        return totalProcessTime
    }
}
