//
//  BankTeller.swift
//  BankManagerConsoleApp
//
//  Created by 김민성 on 2021/04/30.
//

import Foundation

struct Teller {
    let tellerIndex: Int
    
    func announceServiceStart(_ clientIndex: Int) {
        print("\(clientIndex)번 고객 업무 시작")
    }
    
    func announceServiceFinish(_ clientIndex: Int) {
        print("\(clientIndex)번 고객 업무 완료")
    }
}
