//
//  Speaker.swift
//  BankManagerConsoleApp
//
//  Created by 고은 on 2021/12/27.
//

import Foundation

struct Speaker {
    enum Situation {
        case start
        case finish
        case close(time: String)
    }
    
    func speak(when situation: Situation, number: Int) {
        switch situation {
        case .start:
            print("\(number) 번 고객 업무 시작")
        case .finish:
            print("\(number) 번 고객 업무 완료")
        case .close(let time):
            print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(number)명이며, 총 업무시간은 \(time)초입니다.")
        }
    }
}

