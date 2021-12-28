import Foundation

struct BankingProgramHandler {
    enum Menu: String {
        case openBank = "1"
        case exitProgram = "2"
        
        var description: String {
            return self.rawValue
        }
    }
    
    enum GuideDescription: String, CustomStringConvertible {
        case menuForInput = """
        1 : 은행개점
        2 : 종료
        입력 :
        """
        case invalidInput = "잘못 입력하셨습니다. 메뉴를 확인해주세요."
        
        var description: String {
            return self.rawValue
        }
    }
    
    func startToReceiveInput() {
        print(GuideDescription.menuForInput.description, terminator: " ")
        
        guard let input = readLine() else {
            return
        }
        
        switch input {
        case Menu.openBank.description:
            setBankWithRandomCustomer()
            startToReceiveInput()
            return
        case Menu.exitProgram.description:
            return
        default:
            print(GuideDescription.invalidInput.description)
            startToReceiveInput()
            return
        }
    }
    
    private func setBankWithRandomCustomer() {
        let randomNumberOfCustomer = Int.random(in: 10...30)
        let numberOfBankClerkForDeposit = 2
        let numberOfBankClerkForLoan = 1
        
        let bank = Bank(numberOfBankClerkForDeposit: numberOfBankClerkForDeposit, numberOfBankClerkForLoan: numberOfBankClerkForLoan, numberOfCustomer: randomNumberOfCustomer)
        bank.openBank()
    }
}
