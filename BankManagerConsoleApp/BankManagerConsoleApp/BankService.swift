//
//  BankService.swift
//  BankManagerConsoleApp
//
//  Created by Kobe, Hemg on 2023/07/14.
//

import Foundation

class BankService {
	private func generateCustomerQueue() -> LinkedList<Customer> {
		var customerQueue = LinkedList<Customer>()
		
		let numberOfCustomers = Int.random(in: 10...30)
		
		for i in 1...numberOfCustomers {
			let customer = Customer(id: i)
			customerQueue.appendNode(customer)
		}
		print("은행 업무 시작")
		return customerQueue
	}
	
	private func processBankWork() {
		let banker = Banker()
		var customerQueue = generateCustomerQueue()
		var totalCustomers = 0
		let sleepTime = TimeInterval(0.7)
		
		let workTime = timeCheck {
			while !customerQueue.isEmpty {
				guard let currentCustomer = customerQueue.removeFirst() else { return }
				
				print("\(currentCustomer.user)번 고객 업무 시작")
				Thread.sleep(forTimeInterval: sleepTime)
				banker.processCustomer(customer: currentCustomer)
				
				totalCustomers = currentCustomer.user
			}
		}
		print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(totalCustomers)명이며, 총 업무시간은 \(workTime)초입니다.")
	}
	
	private func printMenu() {
		print("1: 은행 개점")
		print("2: 종료")
		print("입력:", terminator: " ")
	}
	
	func start() {
		var isExit: Bool = true
		
		while isExit {
			do {
				printMenu()
				guard let input = readLine(),
					  let menuChoice = Int(input) else {
					throw InputError.invalidInput
				}
				
				switch menuChoice {
				case 1:
					processBankWork()
				case 2:
					isExit = false
				default:
					throw InputError.invalidInput
				}
			} catch {
				print(error)
			}
		}
	}
}
