//
//  ProgramManager.swift
//  BankManagerConsoleApp
//
//  Created by mint, Jusbug on 2023/07/13.
//

import Foundation

struct ProgramManager {
    private var program: Manageable
    private var isWorking: Bool = true
    
    init(program: Manageable) {
        self.program = program
    }
    
    private func displayMenu() {
        print(
        """
        1 : \(program.name) 개점
        2 : 종료
        입력 :
        """, terminator: " ")
    }
    
    mutating func selectMenu() {
        while isWorking {
            displayMenu()
            
            guard let input = readLine() else {
                return
            }
            
            switch input {
            case Menu.startProgram.number:
                program.open()
            case Menu.finishProgram.number:
                isWorking = false
            default:
                print("잘못된 입력입니다. 다시 입력해주세요.")
            }
        }
    }
}

extension ProgramManager {
    enum Menu {
        case startProgram
        case finishProgram
        
        var number: String {
            switch self {
            case .startProgram:
                return "1"
            case .finishProgram:
                return "2"
            }
        }
    }
}
