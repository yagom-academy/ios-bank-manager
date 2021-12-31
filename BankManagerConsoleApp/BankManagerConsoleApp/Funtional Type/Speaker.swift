//
//  Speaker.swift
//  BankManagerConsoleApp
//
//  Created by 고은 on 2021/12/27.
//

import Foundation

struct Speaker {
    func speakStart(for number: Int, workType: BankWork) {
        print("\(number) 번 고객 \(workType.koreanDescription)업무 시작")
    }
    
    func speakFinish(for number: Int, workType: BankWork) {
        print("\(number) 번 고객 \(workType.koreanDescription)업무 완료")
    }
    
    func speakClose(number: Int, time: String) {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(number)명이며, 총 업무시간은 \(time)초입니다.")
    }
}
