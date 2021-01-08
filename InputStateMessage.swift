//
//  MessageCollection.swift
//  BankManagerConsoleApp
//
//  Created by 김태형 on 2021/01/07.
//

struct InputStateMessage {
    enum InputState: String {
        case initialization = """
        1 : 은행개점
        2 : 종료
        입력 :  
        """
        case error = "올바른 입력을 부탁드립니다. 개점은 숫자 1을, 종료는 숫자 2를 입력해주세요!"
    }
    
    static func printInputProcessText(state: InputState) {
        switch state {
        case .initialization:
            print(state.rawValue, terminator: "")
        case .error:
            print(state.rawValue)
        }
    }
}
