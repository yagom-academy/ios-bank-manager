//
//  Double+.swift
//  BankManagerUIApp
//
//  Created by Eddy, dudu on 2022/05/07.
//

import Foundation

extension Double {
    var formattedTime: String {
        let minute = Int(self / 60)
        let second = Int(self.truncatingRemainder(dividingBy: 60))
        let miliSecond = self.truncatingRemainder(dividingBy: 1) * 1000
            
        return String(format: "%02d:%02d:%03.0f", minute, second, miliSecond)
    }
}
