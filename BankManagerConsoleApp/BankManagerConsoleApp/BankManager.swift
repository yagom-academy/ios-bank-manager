//
//  BankManager.swift
//  BankManagerConsoleApp
//
//  Created by Yejin Hong on 3/20/24.
//

import Foundation

enum InputMenu: String {
    case open
    case close
    
    var status: String {
        switch self {
        case .open:
            return "1"
        case .close:
            return "2"
        }
    }
}

struct BankManager {
    func executeBankManager(){
        
        print("1 : 은행개점\n2 : 종료")
        
        guard let input = readLine(), !input.isEmpty else {
            print("아무것도 입력되지 않았습니다!")
            return
        }
        
        switch input {
        case InputMenu.open.status:
            print("1")
        case InputMenu.close.status:
            print("2")
        default:
            print("0")
        }
    }
    
    func openBank() {
        // n명의 은행원이 근무한다 -> 은행 타입 생성
        // 랜덤으로 10-30명의 고객을 생성한다 -> 고객 타입 생성
        
        // queue 가 비어있는지 확인한다.
        // queue 에 고객을 담는다
    }
    // InputMenu.open.status 일 때, 업무를 시작한다.
    // ex) 고객의 수가 10명이다
    
    // while
    // 처리 완료할 때마다 customerCompletedCount +1
    // Task.sleep 0.7초
    // print("\(customerCompletedCount)번 고객 업무 완료")
    // InputMenu.close.status 일 때, 업무를 종료한다.
}
