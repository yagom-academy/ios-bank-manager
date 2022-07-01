import Foundation

struct Bank {
    private var customerQueue = CustomerQueue<Customer>(linkedList: LinkedList<Customer>())

    func executeWork(workTime: TimeInterval) -> Int {
        var totalCustomer = 0
        enqueueCustomer()
        (0..<customerQueue.count).forEach { number in
            do {
                let customer = try customerQueue.dequeue()
                BankManager.work(customer: customer, time: workTime)
                totalCustomer += 1
            } catch {
                print("고객이 없습니다.")
                return
            }
        }
        
        return totalCustomer
    }
    
    private func enqueueCustomer() {
        (0..<Int.random(in: 10...30)).forEach { number in
            customerQueue.enqueue(data: Customer(name: "\(number + 1)번"))
        }
    }
}
