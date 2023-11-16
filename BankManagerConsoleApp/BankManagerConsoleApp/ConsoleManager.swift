//
//  ConsoleManager.swift
//  BankManagerConsoleApp
//
//  Created by jyubong, Toy on 11/16/23.
//

enum ConsoleManager {
    private static let menu = """
                              1 : 은행개점
                              2 : 종료
                              입력 :
                              """
    
    static func startBank() {
        print(menu, terminator: " ")
    }
}
    
}
