//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 애쉬, 로빈 on 2022/11/03.
//

struct Bank {
    let bankWorker: BankWorker
    let numberTicketQueue: Queue<Client>
    
    func returnTicketNumber() -> Int {
        return numberTicketQueue.linkedList.count
    }
    
    func updateClientList(_ client: Client) {
        numberTicketQueue.enqueue(client)
    }
    
    func open() {
        print("""
            1. 은행개점
            2. 종료
            입력
            """, terminator: " ")
        
        let menuNumber: String?  = readLine()
        
        switch menuNumber {
        case "1":
            return
        // 실행할 메서드 구현
        case "2":
            return
        default:
            print("올바른 메뉴 번호를 입력해주세요.")
        }
    }
}
