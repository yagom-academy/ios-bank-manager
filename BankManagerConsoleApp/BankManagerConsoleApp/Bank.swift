//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 수꿍, 브래드 on 2022/06/30.
//

struct Bank {
    private var servedClient: Int
    private var waitingClient: Int?
    private var clientQueue: ClientQueue<Client>?
    private var numberOfDepositBanker: Int
    private var numberOfLoanBanker: Int
    
    init(numberOfDepositBanker: Int, numberOfLoanBanker: Int) {
        self.numberOfDepositBanker = numberOfDepositBanker
        self.numberOfLoanBanker = numberOfLoanBanker
        self.servedClient = 0
    }

    mutating func run() {
        showMenu()
        chooseOption()
    }
    
    private func showMenu() {
        print("1 : 은행개점\n2 : 종료")
        print("입력 : ", terminator: "")
    }
    
    private mutating func chooseOption() {
        guard let option = readLine() else {
            return
        }
        
        switch option {
        case Option.open:
            openBank()
        case Option.close:
            break
        default:
            requestReInput()
        }
    }
    
    private mutating func requestReInput() {
        print("잘못된 입력 입니다. 다시 입력해주세요")
        run()
    }
    
    private mutating func openBank() {
        reset()
        runBusiness()
        terminateBusiness()
        run()
    }

    private mutating func reset() {
        servedClient = .zero
        waitingClient = Int.random(in: 10...30)
        clientQueue = makeClientQueue()
    }
    
    private mutating func runBusiness() {
        guard var queue = clientQueue else {
            return
        }

        while queue.isEmpty == false {
            guard let client = queue.dequeue() else {
                return
            }
            
            if client.desiredServices == Option.deposit {
                let depositBanker = DepositBankManager()
                let handledClient = depositBanker.work(from: client)
                
                servedClient += handledClient
            } else if client.desiredServices == Option.loan {
                let loanBanker = LoanBankManager()
                let handledClient = loanBanker.work(from: client)
                
                servedClient += handledClient
            }
        }
    }

    private mutating func terminateBusiness() {
//        let bankingHours = Double(servedClient) * banker.time
        
        print("""
        업무가 마감되었습니다. \
        오늘 업무를 처리한 고객은 총 \(servedClient)명이며, \
        총 업무시간은 \(String(format: "%.1f", 3.3))초입니다.
        """)
    }
    
    private mutating func makeClientQueue() -> ClientQueue<Client>? {
        var clientQueue = ClientQueue<Client>()
        let task = [Option.deposit, Option.loan]
        
        guard let waitingClient = waitingClient else {
            return nil
        }
        
        for waitingNumber in 1...waitingClient {
            guard let taskRandomElement = task.randomElement() else {
                return nil
            }
            let client = Client(waitingNumber: waitingNumber, desiredServices: taskRandomElement)
            clientQueue.enqueue(client)
        }
        return clientQueue
    }
}
