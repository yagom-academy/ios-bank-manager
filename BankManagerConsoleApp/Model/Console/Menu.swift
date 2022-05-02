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
        static let inputMessage = "입력: "
        static let openBankInput = "1"
        static let finshInput = "2"
    }

    private var readInput: String {
        print(MenuContstant.inputMessage, terminator: "")
        guard let input = readLine() else {
            return ""
        }
        return input
    }

    func start() {
        print(MenuContstant.menual)

        switch readInput {
        case MenuContstant.openBankInput:
            startBankPorcess()
            start()
        case MenuContstant.finshInput:
            return
        default:
            start()
        }
    }

    private func startBankPorcess() {
        let bankProcess = BankProcess()
        bankProcess.start()
    }
}
