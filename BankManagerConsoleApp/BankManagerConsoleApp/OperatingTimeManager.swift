//
//  OperatingTimeManager.swift
//  BankManagerConsoleApp
//
//  Created by Eunsoo KIM on 2021/12/24.
//

import Foundation

struct OperatingTimeManager {
  var openTime = CFAbsoluteTime()
  var closeTime = CFAbsoluteTime()
  
  func workingTime() -> String {
    let timeInterval = closeTime - openTime
    
    let numberFormatter = NumberFormatter()
    numberFormatter.roundingMode = .floor
    numberFormatter.maximumSignificantDigits = 3
    
    let workingTime = numberFormatter.string(for: Double(timeInterval)) ?? ""
    return workingTime
  }
}
