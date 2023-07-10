//
//  LinkedList.swift
//  BankManagerConsoleApp
//
//  Created by Kobe, Hemg on 2023/07/10.
//

final class LinkedList<Type> {
	private var head: Node<Type>?
	private var tail: Node<Type>?
	
	func addNode(node: Type) {
		let newNode = Node(value: node)
		
		guard head != nil else {
			head = newNode
			tail = newNode
			return
		}
		
		tail?.next = newNode
		tail = newNode
	}
}
