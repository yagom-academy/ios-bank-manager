//
//  String+Extension.swift
//  BankManagerUIApp
//
//  Created by 조민호 on 2022/05/05.
//

import Foundation

extension String {
    var waitingNumber: String {
        guard let waitingNumber = self.components(separatedBy: "-").first else {
            return ""
        }
        
        return waitingNumber.trimmingCharacters(in: .whitespaces)
    }
}
