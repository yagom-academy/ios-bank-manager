import Foundation

struct Bank {
    var bankClerk: DispatchQueue = DispatchQueue(label: "customSerial")
    var customers: CustomerQueue = CustomerQueue<Customer>()
    var numberOfCustomer: Int = 0
    let dispatchGroup = DispatchGroup()
    
    init(numberOfBankClerk: Int, numberOfCustomer: Int) {
        for index in 0..<numberOfCustomer {
            let customer = Customer(number: (index + 1))
            customers.enqueue(value: customer)
        }
        
        self.numberOfCustomer = numberOfCustomer
    }
    
    func openBank() {
        dispatchGroup.enter()
        let totalTime = checkTotalTime(of: handleTaskOfAllCustomers)
        dispatchGroup.leave()
        
        dispatchGroup.wait()
        notifyBankClosing(with: totalTime)
    }
    
    func checkTotalTime(of taskFunction: () -> Void) -> String {
        let startTime = CFAbsoluteTimeGetCurrent()
        
        taskFunction()
        
        let totalTime = CFAbsoluteTimeGetCurrent() - startTime

        let totalTimeInString: String = String(format: "%.2f", totalTime)

        return totalTimeInString
    }
    
    func handleTaskOfAllCustomers() {
        let taskItem = DispatchWorkItem {
            if let currentCustomer = customers.peek {
                print(currentCustomer.number)
                workOnTask(of: currentCustomer)
            }
        }
        
        for _ in 0..<numberOfCustomer {
            bankClerk.sync(execute: taskItem)
        }
    }
    
    func workOnTask(of customer: Customer) {
        notifyStartingTask(of: customer)
        
        let taskOfCustomer = customer.task
        taskOfCustomer()

        notifyFinisingTask(of: customer)
        
        do {
            try customers.dequeue()
        } catch {
            print(error)
        }
    }

    func notifyStartingTask(of customer: Customer) {
        print("\(customer.number)번 고객 업무 시작")
    }
    
    func notifyFinisingTask(of customer: Customer) {
        print("\(customer.number)번 고객 업무 완료")
    }
    
    func notifyBankClosing(with totalTime: String) {
        print("업무가 마감되었습니다, 오늘 업무를 처리한 고객은 총 \(numberOfCustomer)명이며, 총 업무시간은 \(totalTime)초 입니다.")
    }
}
