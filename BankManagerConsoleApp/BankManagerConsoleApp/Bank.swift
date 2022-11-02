//  Created by stone, 애종 on 2022/11/02.

struct Bank {
    private var manager: [BankManager]
    private var customerList: Queue<Customer>
    var totalWorkTime: Double
}
