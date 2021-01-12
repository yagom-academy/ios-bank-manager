//
//  StringExtension.swift
//  BankManagerConsoleApp
//
//  Created by Yeon on 2021/01/04.
//

import Foundation

extension String {
    func format(_ arguments: CVarArg...) -> String {
        let args = arguments.map {
            if let arg = $0 as? Int {
                return String(arg)
            }
            if let arg = $0 as? Double {
                return String(arg)
            }
            if let arg = $0 as? String {
                return String(arg)
            }
            
            return StringFormattingError.noMatchingType.localizedDescription
        } as [CVarArg]
        return String.init(format: self, arguments: args)
    }
}
