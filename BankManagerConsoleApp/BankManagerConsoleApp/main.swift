//
//  main.swift
//  BankManagerConsoleApp
//
//  Copyright (c) 2022 Zhilly, Minii All rights reserved.

let console = ConsoleManager()

while true {
    switch console.startConsole() {
    case 1:
        print("은행 개점")
    case 2:
        break
    default:
        print("다시 입력하세요")
    }
}
