//
//  BankManager.swift
//  BankManagerConsoleApp

struct BankManager {
    private var bank: Bank = Bank(numberOfClerks: 1)
    private var timePerTask: Double = 0.7
    
    mutating func run() {
        printMenu()
        let userInput = readLine()
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
    
    mutating func identifyMenu(_ userInput: String?) {
        switch userInput {
        case "1":
            open()
            close()
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
    
    mutating func open() {
        let customers: Int = createCustomer()
        for _ in 1...customers {
            bank.performTask()
        }
    }
    
    func close() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(bank.customerCount)명이며, 총 업무시간은 \(Double(bank.customerCount) * timePerTask)초 입니다.")
    }
}
