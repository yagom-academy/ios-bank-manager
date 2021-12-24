import Foundation

struct Bank {
    var bankClerk: DispatchQueue = DispatchQueue(label: "customSerial")
    var customers: CustomerQueue = CustomerQueue<Customer>()
    var numberOfCustomer: Int = 0
    let dispatchGroup = DispatchGroup()
    let semaphore = DispatchSemaphore(value: 1)
    
    init(numberOfBankClerk: Int, numberOfCustomer: Int) {
        for index in 0..<numberOfCustomer {
            let customer = Customer(number: index)
            customers.enqueue(value: customer)
        }
        
        self.numberOfCustomer = numberOfCustomer
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
    
    func handleTaskOfAllCustomers() {
        let taskItem = DispatchWorkItem {
            if let currentCustomer = customers.peek {
                print(currentCustomer.number)
                workOnTask(of: currentCustomer)
            }
        }
        
        for _ in 0..<numberOfCustomer {
            bankClerk.async(group: dispatchGroup, execute: taskItem)
        }
    }
    
    func openBank() {
        dispatchGroup.enter()
        handleTaskOfAllCustomers()
        dispatchGroup.leave()
        
        dispatchGroup.notify(queue: bankClerk) {
            semaphore.wait() // 테스트 필요 (메뉴 2번 연속 출력되는 문제)
            notifyBankClosing()
        }
    }
    
    func notifyStartingTask(of customer: Customer) {
        print("\(customer.number)번 고객 업무 시작")
    }
    
    func notifyFinisingTask(of customer: Customer) {
        print("\(customer.number)번 고객 업무 완료")
    }
    
    func notifyBankClosing() {
        print("업무가 마감되었습니다, 오늘 업무를 처리한 고객은 총 \(numberOfCustomer)명이며, 총 업무시간은 \(Double(numberOfCustomer) * 0.7)초 입니다.")
        semaphore.signal()
    }
}
