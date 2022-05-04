//
//  Timer.swift
//  BankManagerConsoleApp
//
//  Created by 우롱차, 민성 on 2022/05/04.
//

import Foundation

protocol Timer {
    var from: CFAbsoluteTime? { get set }
    func checkTime() -> CFAbsoluteTime
    func setTimer()
}

extension Timer {
    func checkTime() -> CFAbsoluteTime {
        return CFAbsoluteTimeGetCurrent() - (from ?? 0)
    }
}
