//
//  ProgramManager.swift
//  BankManagerConsoleApp
//
//  Created by mint, Jusbug on 2023/07/13.
//

import Foundation

struct ProgramManager {
    var program: Manageable
    var isWorking: Bool = true
    
    func displayMenu() {
        print(
        """
        1 : \(program.name) 개점
        2 : 종료
        입력 :
        """, terminator: " ")
    }
}
