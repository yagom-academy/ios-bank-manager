//
//  NameSpace.swift
//  BankManagerConsoleApp
//
//  Created by 예톤, 웡빙 on 2022/07/04.
//

import Foundation

enum NameSpace {
    case one
    case two
    case startMessage
}

extension NameSpace {
    var print: String {
        switch self {
        case .one:
            return "1"
        case .two:
            return "2"
        case .startMessage:
            return "1 : 은행 개점\n2 : 종료\n입력 :"
        }
    }
}
