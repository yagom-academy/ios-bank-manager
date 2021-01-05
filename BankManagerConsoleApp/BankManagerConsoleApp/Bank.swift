
struct Bank {
    private var serviceCounter: [BankClerk] = []
    private var waitingList: [Client] = []
    private var totalVistedClientsNumber: Int = 0
    private var totalOperatingTime: Float = 0.0
    private var numberOfEmployees: Int = 1
    var endingMent: String {
            return "업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalVistedClientsNumber)명이며, 총 업무시간은 \(totalOperatingTime)초입니다."
    }
    lazy var initialNumberOfClients: Int = 0 {
        didSet {
            self.loadWaitingList(of: initialNumberOfClients)
            self.totalVistedClientsNumber = initialNumberOfClients
        }
    }

    init() {
        self.serviceCounter = loadBankClerks(of: numberOfEmployees)
        self.waitingList = []
        self.totalVistedClientsNumber = 0
        self.totalOperatingTime = 0.0
    }
    
    private mutating func loadBankClerks(of number: Int) -> [BankClerk]{
        for _ in 0 ..< number {
            let newBankClerk = BankClerk()
            self.serviceCounter.append(newBankClerk)
        }
        return self.serviceCounter
    }
    
    private mutating func loadWaitingList(of size: Int) {
        for i in 1...size {
            let newClient = Client(waitingNumber: i, business: .basic(requiredTime: 0.7))
            waitingList.append(newClient)
        }
        self.totalVistedClientsNumber = size
    }
    
    mutating func serve() {
        while (!waitingList.isEmpty) {
            let inProcessClient = waitingList.removeFirst()
            // bankClerk가 다수일경우, assignedEmployee를 설정하는 과정을 추가해야한다.
            let assignedEmployee = serviceCounter[0]
            assignedEmployee.isWorking = true
            while assignedEmployee.isWorking {
                print("\(inProcessClient.waitingNumber)번 고객 업무 시작")
                assignedEmployee.handleBusiness(of: inProcessClient)
                print("\(inProcessClient.waitingNumber)번 고객 업무 종료")
                assignedEmployee.isWorking = false
            }
        }
        
        for employee in serviceCounter {
            totalOperatingTime = (totalOperatingTime >= employee.totalWorkingTime) ? totalOperatingTime : employee.totalWorkingTime
        }
       
    }
}
