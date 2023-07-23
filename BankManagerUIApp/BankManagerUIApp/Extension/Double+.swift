//
//  Double+.swift
//  BankManagerUIApp
//
//  Created by kyungmin, Max on 2023/07/20.
//

extension Double {
    func formatTimeIntervalToString() -> String {
        let minutes = String(format: "%02d", Int((self/60).truncatingRemainder(dividingBy: 60)))
        let seconds = String(format: "%02d", Int(self.truncatingRemainder(dividingBy: 60)))
        let milliseconds = String(format: "%003d", Int(self.truncatingRemainder(dividingBy: 1) * 1000))

        return "\(minutes):\(seconds):\(milliseconds)"
    }
}
