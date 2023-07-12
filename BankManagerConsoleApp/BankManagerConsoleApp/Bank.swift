//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by Min Hyun on 2023/07/12.
//

import Foundation

struct Bank {
    private var banker = OperationQueue()
    private var dailyCustomerQueue = CustomerQueue<Customer>()
    private var dailyTotalCustomer: Int = .zero
    private var dailyBusinessHour: Decimal = .zero
    
    mutating func dailyWork() {}
    mutating private func setDailyCustomerQueue() {}
    mutating private func customerTask() {}
    mutating private func closeBank() {}
    mutating private func resetBank() {}
}


/*
 - 업무처리하는 은행원(Operation Queue) -> 은행원수 : STEP 2에서는 1 (init에서 enum으로 세팅된 숫자 불러오기)
 - 오늘의 고객 대기열
 - 오늘 업무를 처리한 고객수
 - 오늘의 총 업무시간
 - 하루에 처리하는 업무
        1. 10~30명 사이의 고객수 정하기 & 고객수에 맞게 고객 객체 생성하여 대기열에 추가
    -while 시작
    2. 대기열에 있는 고객들을 한 명씩 꺼내어 은행원에 전달
        3. ***** 각 고객 업무 처리(print문 두 개 - 시작 / 완료) ***** Operation Task로 넘길 내용
        4. 오늘의 고객수 + 1, 총 업무시간 + 고객의 duration
    -while 종료
        5. 전체 고객 업무 종료 후 업무 마감 print
            6. 오늘의 고객 대기열, 고객수, 업무시간 초기화
 */

