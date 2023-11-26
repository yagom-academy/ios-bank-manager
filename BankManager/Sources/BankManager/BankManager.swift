import Foundation

public struct BankManager {
    
    public init() { }
    
    private var bank = Bank()
    
    public mutating func bankManageStart() {
        var bankOpeningStatus = true
        
        while bankOpeningStatus {
            let bankOperationSwitch = presentMenu()
            
            bankOpeningStatus = bankProcessing(
                bank: bank,
                bankOperationSwitch: bankOperationSwitch
            )
        }
    }
    
    private func presentMenu() -> BankOperation {
        print("""
              1 : 은행개점
              2 : 종료
              입력 :
              """, terminator: " ")
        
        if let userInput = readLine(), let bankOperation = BankOperation(rawValue: userInput) {
            return bankOperation
        }
        return BankOperation.invalidInput
    }
    
    private func bankProcessing(bank: Bank, bankOperationSwitch: BankOperation) -> Bool {
        switch bankOperationSwitch {
        case .bankOpen:
            bank.start()
            return true
        case .exit:
            return false
        default:
            return true
        }
    }
}

extension BankManager {
    enum BankOperation: String {
        case bankOpen = "1"
        case exit = "2"
        case invalidInput = ""
    }
}











