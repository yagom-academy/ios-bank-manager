//
//  ConsoleManager.swift
//  BankManagerConsoleApp
//
//  Copyright (c) 2022 Minii All rights reserved.

struct ConsoleManager {
    func startConsole() {
        print("""
        1 : 은행개점
        2 : 종료
        입력 :
        """, terminator: " ")
        let input = readLine()
    }
}
