//
//  Protocol.swift
//  BankManagerConsoleApp
//
//  Created by 김민성 on 2021/05/03.
//

import Foundation

protocol Tellable {

    var tellerIndex: Int  { get }
    
    func conductService(_ client: inout Queue<Int>)
    
}
