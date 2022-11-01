//
//  Node.swift
//  BankManagerConsoleApp
//
//  Created by Gundy, jpush on 2022/11/01.
//

class Node<DataType: Queueable> {
    var data: DataType
    var next: Node<DataType>?
    
    init(data: DataType) {
        self.data = data
    }
}
