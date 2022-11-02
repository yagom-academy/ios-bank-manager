//  Created by stone, 애종 on 2022/11/02.

struct Bank {
    private var manager: [BankManager]
    private var customerList: Queue<Customer>
    var totalWorkTime: Double
    
    init() {
        self.manager = [BankManager()]
        self.customerList = Queue()
        self.totalWorkTime = 0.0
    }
    
    func start() {
        print("""
            1 : 은행 개점
            2 : 종료
            입력 :
            """, terminator: "")
        
        guard let input = readLine() else { return }
        
        switch input {
        case "1":
            break
        case "2":
            break
        default:
            start()
        }
    }
    
    mutating func openBank() {
        let numberOfCustomer: Int = Int.random(in: 10...30)
        
        for number in 1...numberOfCustomer {
            self.customerList.enqueue(Customer(number: number))
        }
    }
}
