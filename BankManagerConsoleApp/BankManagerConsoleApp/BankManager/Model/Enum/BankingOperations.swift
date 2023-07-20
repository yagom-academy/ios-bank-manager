//
//  BankingOperations.swift
//  BankManagerConsoleApp
//
//  Created by Kobe, Hemg on 2023/07/19.
//

enum BankingOperations: CaseIterable {
	case deposit
	case loan
	
	var duration: Double {
		switch self {
		case .deposit:
			return 0.7
		case .loan:
			return 1.1
		}
	}
	
	var financialProductsName: String {
		switch self {
		case .deposit:
			return "예금"
		case .loan:
			return "대출"
		}
	}
}
