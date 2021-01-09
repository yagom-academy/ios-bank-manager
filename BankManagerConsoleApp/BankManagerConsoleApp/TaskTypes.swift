//
//  taskTypes.swift
//  BankManagerConsoleApp
//
//  Created by 김태형 on 2021/01/09.
//

import Foundation

struct TaskType {
    enum RequiredTime: useconds_t {
        case deposit = 70000
        case loan = 110000
    }
    
    enum TaskMessage: String {
        case deposit = "예금"
        case loan = "대출"
    }
}
