//
//  Date+extension.swift
//  BankManagerUIApp
//
//  Created by 레옹아범, 혜모리 on 2023/03/15.
//

import Foundation

extension Date {
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "mm:ss:SSS"
        
        return dateFormatter
    }()
    
    func applyDateFormatter() -> String {
        guard let value = Date.dateFormatter.string(for: self) else {
            return BankOption.defalutWorkTime
        }
        
        return value
    }
}
