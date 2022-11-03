//
//  BankManager.swift
//  BankManagerConsoleApp

struct BankManager {
    private var bank: Bank = Bank(numberOfClerks: 1)
    
    mutating func run() {
        printMenu()
        
        let userInput = fetchUserInput()
        identifyMenu(userInput)
        
    }
    
    func printMenu() {
        print(
            """
            1 : 은행개점
            2 : 종료
            입력
            """,
            terminator: " : ")
    }
    
    func fetchUserInput() -> String? {
        guard let userInput = readLine() else { return nil }
        
        return userInput
    }
    
    mutating func identifyMenu(_ userInput: String?) {
        switch userInput {
        case "1":
            let customers = createCustomer()
            for _ in 1...customers {
                bank.performTask()
            }
            print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 n명이며, 총 업무시간은 0.00초 입니다.")
        case "2":
            return
        default:
            print("") // 에러처리
        }
    }
    
    mutating func createCustomer() -> Int {
        let customers: Int = Int.random(in: 10...30)
        
        for i in 1...customers {
            let customer: Customer = Customer(queueNumber: i)
            bank.addCustomer(customer)
        }
        
        return customers
    }
}
