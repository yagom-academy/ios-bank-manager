//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 수꿍, 브래드 on 2022/06/30.
//

struct Bank {
    private var banker: Banker
    private var servedClient: Int?
    private var waitingClient: Int?
    private var clientQueue: ClientQueue<Client>?
    
    init(banker: Banker) {
        self.banker = banker
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
        
        let handledClient = banker.work(from: &queue)
        servedClient = handledClient
    }

    private mutating func terminateBusiness() {
        guard let servedClient = servedClient else {
            return
        }
        
        let bankingHours = Double(servedClient) * banker.time
        
        print("""
        업무가 마감되었습니다. \
        오늘 업무를 처리한 고객은 총 \(servedClient)명이며, \
        총 업무시간은 \(String(format: "%.1f", bankingHours))초입니다.
        """)
    }
    
    private mutating func makeClientQueue() -> ClientQueue<Client>? {
        var clientQueue = ClientQueue<Client>()
        
        guard let waitingClient = waitingClient else {
            return nil
        }

        for waitingNumber in 1...waitingClient {
            let client = Client(waitingNumber: waitingNumber)
            clientQueue.enqueue(client)
        }
        return clientQueue
    }
}
