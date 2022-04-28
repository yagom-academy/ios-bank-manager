//
//  Console.swift
//  BankManagerConsoleApp
//
//  Created by 우롱차, 민성 on 2022/04/28.
//

import Foundation

struct Menu {
    private enum MenuContstant {
        static let menual =
        """
        1 : 은행개점
        2 : 종료
        """
        static let InputMessage = "입력: "
        static let openBank = "1"
        static let finsh = "2"
    }

    func start() {
        var inputValue: String

        print(MenuContstant.menual)
        inputValue = readInput()

        switch inputValue {
        case MenuContstant.openBank:
            startWorking()
            start()
        case MenuContstant.finsh:
            return
        default:
            start()
        }
    }

    private func readInput() -> String {
        print(MenuContstant.InputMessage, terminator: "")
        guard let input = readLine() else {
            return ""
        }

        return input
    }

    private func startWorking() {
        let bankProcess = BankProcess()
        bankProcess.start()
    }
}
