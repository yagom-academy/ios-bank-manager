//
//  BankManagerConsole+Extension.swift
//  BankManagerConsoleApp
//
//  Created by 수꿍, 브래드 on 2022/07/05.
//

extension BankManagerConsole {
    func showMenu() {
        print("1 : 은행개점\n2 : 종료")
        print("입력 : ", terminator: "")
    }
    
    mutating func chooseOption() {
        guard let option = readLine() else {
            return
        }
        switch option {
        case Namespace.open:
            let waitingClient = Int.random(in: Namespace.randomNumberOfClient)
            var yagomBank = Bank(waitingClient: waitingClient,
                                 numberOfDepositBanker: Namespace.numberOfDepositBanker,
                                 numberOfLoanBanker: Namespace.numberOfLoanBanker)
            yagomBank.openBank()
            run()
        case Namespace.close:
            break
        default:
            requestReInput()
        }
    }
    
    private mutating func requestReInput() {
        print("잘못된 입력 입니다. 다시 입력해주세요")
        run()
    }
}
