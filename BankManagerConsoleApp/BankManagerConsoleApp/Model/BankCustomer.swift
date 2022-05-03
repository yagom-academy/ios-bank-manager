//
//  Customer.swift
//  BankManagerConsoleApp
//
//  Created by Eddy, dudu on 2022/04/26.
//

enum Banking: CaseIterable {
    case deposit
    case loan
}

extension Banking {
    var name: String {
        switch self {
        case .deposit:
            return "예금"
        case .loan:
            return "대출"
        }
    }

    var processTime: Double {
        switch self {
        case .deposit:
            return 0.7
        case .loan:
            return 1.1
        }
    }
}

protocol Customer {
    var waitingNumber: Int { get }
    var workType: Banking { get }
    init(waitingNumber: Int, workType: Banking)
}

extension Customer {
    static func randomCustomers() -> [Self] {
        let customerCount = Int.random(in: 10...30)
        let customers = (1...customerCount).map(makeCustomer)

        return customers
    }

    private static func makeCustomer(number: Int) -> Self {
        let customerType = Banking.allCases.randomElement() ?? .deposit
        let customer = Self(waitingNumber: number, workType: customerType)

        return customer
    }
}

struct BankCustomer: Customer {
    let waitingNumber: Int
    var workType: Banking
}
